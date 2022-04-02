import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/weather_forecast/model/weather_json_model.dart';
import 'package:weather_app/weather_forecast/ui_design/forecast_util.dart';

class NetworkForecast {
  Future<WeatherJsonModel> getWeatherForecast(
      {required String cityName}) async {
    var finalUrl =
        "http://api.openweathermap.org/data/2.5/weather?q=$cityName,Bangladesh&appid=${Util.appId}";

    final response = await get(Uri.parse(finalUrl));

    if (response.statusCode == 200) {
      print("weather data :${response.body}");
      return WeatherJsonModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error getting weather forecast.");
    }
  }
}
