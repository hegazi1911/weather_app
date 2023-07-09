import 'package:weather_app/Model/weather_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;
  WeatherSuccess(this.weatherModel);
}

class WeatherFailure extends WeatherState {}
