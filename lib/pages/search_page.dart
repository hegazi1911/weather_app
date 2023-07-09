import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Services/weather_services.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final WeatherServices services = WeatherServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: TextField(
              onSubmitted: (data) async {
                BlocProvider.of<WeatherCubit>(context)
                    .getWeather(cityName: data);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  border: OutlineInputBorder(),
                  hintText: "Enter city",
                  suffixIcon: Icon(Icons.search),
                  label: Text("Search"))),
        ),
      ),
    );
  }
}
