import 'package:flutter/material.dart';
import '../Model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  set weatherData(WeatherModel? weatherData) {
    _weatherData = weatherData;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
