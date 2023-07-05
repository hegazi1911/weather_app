// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  String name;
  double temp;
  double maxtemp;
  double mintemp;
  String stateName;
  String icon;

  WeatherModel({
    required this.date,
    required this.name,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.stateName,
    required this.icon,
  });

  factory WeatherModel.fromjson(dynamic data) {
    var jasonData = data["forecast"]["forecastday"][0]['day'];

    return WeatherModel(
        date: data["location"]["localtime"],
        name: data["location"]["name"],
        temp: jasonData["avgtemp_c"],
        maxtemp: jasonData["maxtemp_c"],
        mintemp: jasonData["mintemp_c"],
        stateName: jasonData["condition"]["text"],
        icon: jasonData["condition"]["icon"]);
  }
  @override
  String toString() {
    return "temp = $temp maxtemp = $maxtemp";
  }

  MaterialColor getThemeColor() {
    switch (stateName) {
      case "Clear":
      case "Light Cloud":
        return Colors.orange;
      case "Sleet":
      case "Snow":
      case "Hail":
        return Colors.blue;
      case "Heavy cloud":
        return Colors.blueGrey;
      case "Light Rain":
        return Colors.green;
      case "Heavy Rain":
        return Colors.grey;
      case "Showers":
      case "Moderate rain":
      case "Patchy rain possible":
        return Colors.lightBlue;
      case "Thunder Storm":
        return Colors.deepPurple;
      case "Thunder":
        return Colors.yellow;
      case "Partly cloudy":
        return Colors.grey;
      default:
        return Colors.amber;
    }
  }
}
