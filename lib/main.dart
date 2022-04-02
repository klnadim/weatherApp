import 'package:flutter/material.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/pages/splash_screen.dart';
import 'package:weather_app/weather_forecast/weather_forecast.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: WeatherMain(),
    // initialRoute: "/",
    // routes: {
    //   "/": (context) => WeatherMain(),
    //   "/home": (context) => HomePage(),
    // },
  ));
}
