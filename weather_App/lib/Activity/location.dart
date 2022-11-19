import 'package:geolocator/geolocator.dart';
import 'weather.dart';
class Location {

  late double latitude;
  late double longitude;


  Future<void> getCurrentLocation() async {
    try{
        Position? position = await Geolocator.getLastKnownPosition(forceAndroidLocationManager: true);

        latitude = position!.latitude;
        longitude = position.longitude;
      }catch(e){
       latitude = 24.006355;
       longitude = 89.249298;
    }
  }
}
