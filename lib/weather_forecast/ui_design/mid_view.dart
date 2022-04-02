import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/weather_forecast/model/weather_json_model.dart';
import 'package:weather_app/weather_forecast/ui_design/bottom_view.dart';
import 'package:weather_app/weather_forecast/ui_design/forecast_util.dart';
import 'package:weather_app/weather_forecast/utils/convert_icon.dart';
import 'package:weather_app/weather_forecast/weather_forecast.dart';

Widget MidView(AsyncSnapshot<WeatherJsonModel> snapshot) {
  var city = snapshot.data!.name;
  var country = snapshot.data!.sys.country;
  var dateTime = DateTime.fromMillisecondsSinceEpoch(snapshot.data!.dt * 1000);
  var temp = (snapshot.data!.main.temp - 273.15).toStringAsFixed(0);
  var _description = snapshot.data!.weather[0].description;
  var _speed = snapshot.data!.wind.speed.toStringAsFixed(1);
  var _humidity = snapshot.data!.main.humidity.toStringAsFixed(0);
  var _tempMax = (snapshot.data!.main.tempMax - 273.15).toStringAsFixed(0);

  return Column(
    children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "$city,$country",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "${Util.getFormattedDate(dateTime)}",
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(
                height: 15,
              ),
              // Icon(
              //   Icons.wb_sunny,
              //   size: 150,
              // ),
              // FaIcon(
              //   FontAwesomeIcons.cloudSun,
              //   size: 180,
              //   color: Colors.pink[100],
              // ),

              getWeatherIcon(
                  description: snapshot.data!.weather[0].main,
                  color: Colors.amberAccent,
                  size: 198),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${temp}°C",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${_description.toUpperCase()}",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 15),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("${_speed} mi/h"),
                        Icon(
                          Icons.arrow_right_alt_outlined,
                          size: 25,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          Text("${_humidity}%"),
                          Icon(
                            Icons.hot_tub,
                            size: 25,
                            color: Colors.brown,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text("${_tempMax} °C"),
                        Icon(
                          Icons.thermostat,
                          size: 25,
                          color: Colors.brown,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
