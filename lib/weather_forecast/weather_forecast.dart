import 'package:flutter/material.dart';
import 'package:weather_app/weather_forecast/model/weather_json_model.dart';
import 'package:weather_app/weather_forecast/network/network.dart';
import 'package:weather_app/weather_forecast/ui_design/bottom_view.dart';
import 'package:weather_app/weather_forecast/ui_design/mid_view.dart';

class WeatherMain extends StatefulWidget {
  const WeatherMain({
    Key? key,
  }) : super(key: key);

  @override
  _WeatherMainState createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  String _cityName = "Dhaka";
  Future<WeatherJsonModel>? weatherForecase;
  Widget TextFieldForSearch() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: "Enter Your City",
            prefixIcon: Icon(Icons.search_outlined),
            contentPadding: EdgeInsets.all(10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        onSubmitted: (value) {
          setState(() {
            String _cityName = value;
            weatherForecase = getWeather(_cityName);
          });
        },
      ),
    );
  }

  Future<WeatherJsonModel> getWeather(String _cityName) =>
      NetworkForecast().getWeatherForecast(cityName: _cityName);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    weatherForecase = getWeather(_cityName);
    // weatherForecase!.then((value) {
    //   print(value.sys.country);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          TextFieldForSearch(),
          Container(
              child: FutureBuilder<WeatherJsonModel>(
            future: weatherForecase,
            builder: (context, snapshot) {
              // List children;

              if (snapshot.hasData) {
                return Column(
                  children: [MidView(snapshot), BottomView(snapshot, context)],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ))
        ],
      ),
    );
  }
}
