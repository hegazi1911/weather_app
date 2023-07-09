import 'package:flutter/material.dart';
import 'package:weather_app/Services/weather_services.dart';
import '../Model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherServices weatherServices = WeatherServices();
  WeatherModel? _weatherModel;
  Future<WeatherModel?> getWeather({required String cityName}) async {
    _weatherModel = await weatherServices.getWeather(cityName: cityName);
    notifyListeners();
    return weatherModel;
  }

  WeatherModel? get weatherModel => _weatherModel;
}
