import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';
import 'weather.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? location;
  String? temp; //C
  String? humidity; //%
  String? air_Speed; //km/h
  String? description;
  String? main ;
  String? icon;
  void startApp() async{
    worker worker_model = worker();
    await worker_model.getLocationData();

    print(temp);
    setState(() {
      temp = worker_model.temp;
      humidity = worker_model.humidity;
      air_Speed = (worker_model.air_Speed)?.substring(0,4);
      description = worker_model.description;
      main = worker_model.main;
      icon = worker_model.icon;
    });
}

  @override
  void initState() {
    startApp();
    //print(icon);
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    var city_name  = ["Dhaka","Rajshahi","Sylhet","Khulna","Rangpur","London","Delhi","Mumbai","Doha","Abu Dhabi"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
        Expanded(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  colors: [
                    Colors.lightBlueAccent,
                    Colors.blueAccent
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container( //Search Container
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(24)
                    ),
                    child: Row(
                      children:[
                        GestureDetector(
                          onTap: (){
                            print('search me');
                          },
                          child: Container(child: Icon(Icons.search,color: Colors.black,),margin: EdgeInsets.fromLTRB(3, 0, 7, 0),),
                        ),
                        Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search $city"
                              ),
                            ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                              color: Colors.white60.withOpacity(0.5)
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Image.network("http://openweathermap.org/img/wn/$icon@2x.png"),
                              SizedBox(width: 20,),
                              Column(
                                children: [
                                  Text("$description",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text("In Rajshahi",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                              color: Colors.white60.withOpacity(0.5)
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                          padding: EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.wiThermometer),
                              SizedBox(height: 40,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("$temp",style: TextStyle(
                                    fontSize: 90
                                  ),
                                  ),
                                  Text("C",style: TextStyle(
                                    fontSize: 30
                                  ),)
                                ],
                              )
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                              color: Colors.white60.withOpacity(0.5)
                          ),
                          margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(WeatherIcons.wiDayWindy),
                                ],
                              ),
                              SizedBox(height: 30,),
                              Text("$air_Speed",style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),),
                              Text("Km/hr")
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white60.withOpacity(0.5)
                          ),
                          margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(WeatherIcons.wiHumidity),
                                ],
                              ),
                              SizedBox(height: 30,),
                              Text("$humidity",style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                              ),),
                              Text("Percent")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Made By Rudro",
                        style: TextStyle(
                          color: Colors.white60
                        ),
                        ),
                        Text("Data Provided by OpenWeatherMap.org",
                          style: TextStyle(
                              color: Colors.white60
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
  ]
    ),
          )
    );
  }
}
class worker{
  String? location;
  String? temp;
  String? humidity;
  String? air_Speed;
  String? description;
  String? main;
  String? icon;

  Future<void> getLocationData() async {
    try {
      var weatherData = await Weather().getLocationWeather();
      //print("hello");
      //Getting temp,humidity
      Map temp_data = weatherData['main'];
      int getHumidity = temp_data['humidity'];
      double getTemp = temp_data['temp'] ;

      //Getting wind speed
      Map wind = weatherData['wind'];
      double getWind_speed = wind['speed']/0.27777777777778;

      //Getting description
      List weather_data = weatherData['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDes = weather_main_data['description'];
      String getIcon = weather_main_data['icon'].toString();


      //Assigning values
      temp = getTemp.toString();
      humidity = getHumidity.toString();
      air_Speed = getWind_speed.toString();
      description = getDes;
      main = getMain_des;
      icon = getIcon;
      //print(temp);
    }catch(e){
      temp = "Error occured";
      humidity = "Error occured";
      air_Speed = "Error occured";
      description = "Error occured";
      main = "Error occured";
      icon = "03n";
    }
  }

}
