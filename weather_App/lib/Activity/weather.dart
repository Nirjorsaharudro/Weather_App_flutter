import 'dart:convert';

import 'package:flutter/material.dart';

import 'location.dart';
import 'package:http/http.dart' as http;

const apiKey = '8146ccaa75a8dbdf5d9c8d27a90f0446';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class Weather {
  Future<dynamic> getCityWeather(String cityName) async {
    var weatherData = await getData('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    return weatherData;
  }
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    var weatherData = await getData(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    return weatherData;
  }

  Future getData(url) async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}