import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/Model/weather_model.dart';

class WeatherServices {
  final Dio dio = Dio();
  Future<WeatherModel?> getWeather({required String cityName}) async {
    String baseUrl = "http://api.weatherapi.com/v1";
    String apikey = "b0683afe1f39498699a181622230605";
    String url = "$baseUrl/forecast.json?key=$apikey&q=$cityName&days=7";
    WeatherModel? weather;
    try {
      Response response = await dio.get(url);
      weather = WeatherModel.fromjson(response.data);
      log(response.data.toString());
    } catch (e) {}
    return weather;
  }
}
