import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Model/weather_model.dart';

class WeatherServices {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    String baseUrl = "http://api.weatherapi.com/v1";
    String apikey = "b0683afe1f39498699a181622230605";
    Uri url =
        Uri.parse("$baseUrl/forecast.json?key=$apikey&q=$cityName&days=7");
    WeatherModel? weather;
    try {
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromjson(data);
    } catch (e) {}
    return weather;
  }
}
