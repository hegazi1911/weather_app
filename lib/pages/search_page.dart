import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Model/weather_model.dart';
import 'package:weather_app/Services/weather_services.dart';

import 'package:weather_app/weather_Provider.dart';

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
                WeatherModel? response =
                    await services.getWeather(cityName: data);

                Provider.of<WeatherProvider>(context, listen: false)
                    .WeatherData = response;
                if (response != null) {
                  Navigator.pop(context);
                } else {
                  var snackBar = SnackBar(content: Text('Wrong City'));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
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
