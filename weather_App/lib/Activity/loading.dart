import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/src/double_bounce.dart';
import 'weather.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 5), () {
          Navigator.pushReplacementNamed(context, "/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight,
            end: Alignment.bottomRight,colors: [
              Color(0xFF003E65),
              Color(0xFF003E65)
            ],)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                 Image.asset('assests/images/weather.png',height: 300.0,width: 300.0,),
                 Text("Weather App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 25.0,
                    ),
                 ),
              ]),
            SpinKitDoubleBounce(
              color: Colors.white,
              size: 100.0,
            ),
            Text('Created by Rudro',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            )
          ],
        ),
      ),
    );
  }

}
