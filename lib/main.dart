import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherAPP()));
}

class WeatherAPP extends StatelessWidget {
  const WeatherAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Provider.of<WeatherProvider>(context)
                  .weatherModel
                  ?.getThemeColor() ??
              Colors.blue,
        ),
        home: HomePage());
  }
}
