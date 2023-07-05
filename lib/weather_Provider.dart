import 'package:flutter/material.dart';
import 'package:weather_app/Model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _WeatherData;
  set WeatherData(WeatherModel? Weather) {
    _WeatherData = Weather;
    notifyListeners();
  }

  WeatherModel? get WeatherData => _WeatherData;
}
