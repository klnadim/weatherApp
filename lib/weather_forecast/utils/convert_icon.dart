import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon({String? description, Color? color, double? size}) {
  switch (description) {
    case "Clear":
      {
        return FaIcon(
          FontAwesomeIcons.sun,
          color: color,
          size: size,
        );
      }
      break;
    case "Clouds":
      {
        return FaIcon(
          FontAwesomeIcons.cloud,
          color: color,
          size: size,
        );
      }
    case "Rain":
      {
        return FaIcon(
          FontAwesomeIcons.cloudRain,
          size: size,
          color: color,
        );
      }
    case "Snow":
      {
        return FaIcon(
          FontAwesomeIcons.snowman,
          color: color,
          size: size,
        );
      }
    default:
      {
        return FaIcon(
          FontAwesomeIcons.sun,
          size: size,
          color: color,
        );
      }
  }
}
