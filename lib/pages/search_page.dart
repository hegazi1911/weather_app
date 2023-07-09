import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Model/weather_model.dart';

import '../providers/weather_provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: TextField(
              onSubmitted: (data) async {
                WeatherModel? weatherModel =
                    await Provider.of<WeatherProvider>(context, listen: false)
                        .getWeather(cityName: data);

                if (weatherModel != null) {
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
