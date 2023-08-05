import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/Services/weather_services.dart';
import 'package:weather_app/Weather_riverpod/weather_riverpod.dart';

class SearchPage extends StatelessWidget {
  final WeatherServices services = WeatherServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Consumer(
            builder: (context, ref, child) {
              return TextField(
                onSubmitted: (data) {
                  ref.read(WeatherProvider.notifier).getWeather(cityName: data);

                  Navigator.pop(context);
                },
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  border: OutlineInputBorder(),
                  hintText: "Enter city",
                  suffixIcon: Icon(Icons.search),
                  label: Text("Search"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
