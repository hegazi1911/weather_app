import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Services/weather_services.dart';
import 'package:weather_app/cubits/Weather_cubit/weather_cubit.dart';

import 'pages/home_page.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherServices());
      },
      child: const WeatherAPP()));
}

class WeatherAPP extends StatelessWidget {
  const WeatherAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            // primarySwatch: Provider.of<WeatherProvider>(context)
            //         .WeatherData
            //         ?.getThemeColor() ??
            //     Colors.blue,
            ),
        home: HomePage());
  }
}
