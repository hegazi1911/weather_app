import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/home_page.dart';

void main() {
  runApp(ProviderScope(child: const WeatherAPP()));
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
