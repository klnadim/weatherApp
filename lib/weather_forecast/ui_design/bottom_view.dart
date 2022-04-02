import 'package:flutter/material.dart';
import 'package:weather_app/weather_forecast/model/weather_json_model.dart';

Widget BottomView(
    AsyncSnapshot<WeatherJsonModel> snapshot, BuildContext context) {
  // var = snapshot.data
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "7-day weather forecast".toUpperCase(),
        style: TextStyle(fontSize: 14, color: Colors.black38),
      ),
      Container()
    ],
  );
}
