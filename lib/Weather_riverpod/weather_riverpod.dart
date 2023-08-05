import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/weather_model.dart';
import '../Services/weather_services.dart';

class WeatherNotifier extends ChangeNotifier {
  WeatherModel? weatherModel;

  void getWeather({required String cityName}) async {
    WeatherServices weatherServices = WeatherServices();

    weatherModel = await weatherServices.getWeather(cityName: cityName);
  }
}

final WeatherProvider = ChangeNotifierProvider<WeatherNotifier>((ref) {
  return WeatherNotifier();
});
