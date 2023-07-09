import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Model/weather_model.dart';
import 'package:weather_app/Services/weather_services.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherServices weatherServices;
  WeatherModel? weatherModel;
  WeatherCubit(this.weatherServices) : super(WeatherInitial());

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherServices.getWeather(cityName: cityName);
      weatherModel != null
          ? emit(WeatherSuccess(weatherModel!))
          : emit(WeatherFailure());
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
