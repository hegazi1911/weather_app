import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Model/weather_model.dart';
import 'package:weather_app/cubits/Weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/Weather_cubit/weather_state.dart';

import 'search_page.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather APP"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSuccess) {
          weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                weatherData?.getThemeColor() as Color,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Column(children: [
              const Spacer(
                flex: 3,
              ),
              Text(
                weatherData!.name,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              Text(weatherData!.date),
              const Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network("http:${weatherData!.icon}"),
                  Text(
                    weatherData!.temp.toInt().toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  Column(
                    children: [
                      Text(
                        "max:${weatherData!.maxtemp.toInt()}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        "min:${weatherData!.mintemp.toInt()}",
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                weatherData!.stateName,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              const Spacer(
                flex: 3,
              )
            ]),
          );
        } else if (state is WeatherFailure) {
          return const Center(
            child: Text("Somthing Went Wrong Please try again"),
          );
        } else {
          return const Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "there is no Weather 😒\nstart Searching now 🔎 ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  )
                ]),
          );
        }
      }),
      // body: weatherData == null
      //     ? const Center(
      //         child: Column(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             children: [
      //               Text(
      //                 "there is no Weather 😒\nstart Searching now 🔎 ",
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(fontSize: 20),
      //               )
      //             ]),
      //       )
      //     : Container(
      //         decoration: BoxDecoration(
      //             gradient: LinearGradient(
      //           colors: [
      //             weatherData?.getThemeColor() as Color,
      //             Colors.white,
      //           ],
      //           begin: Alignment.topCenter,
      //           end: Alignment.bottomCenter,
      //         )),
      //         child: Column(children: [
      //           const Spacer(
      //             flex: 3,
      //           ),
      //           Text(
      //             weatherData!.name,
      //             style: const TextStyle(
      //                 fontSize: 30, fontWeight: FontWeight.w500),
      //           ),
      //           Text(weatherData!.date),
      //           const Spacer(
      //             flex: 1,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             children: [
      //               Image.network("http:${weatherData!.icon}"),
      //               Text(
      //                 weatherData!.temp.toInt().toString(),
      //                 style: const TextStyle(fontSize: 30),
      //               ),
      //               Column(
      //                 children: [
      //                   Text(
      //                     "max:${weatherData!.maxtemp.toInt()}",
      //                     style: const TextStyle(fontSize: 20),
      //                   ),
      //                   Text(
      //                     "min:${weatherData!.mintemp.toInt()}",
      //                     style: const TextStyle(fontSize: 20),
      //                   )
      //                 ],
      //               )
      //             ],
      //           ),
      //           const Spacer(
      //             flex: 1,
      //           ),
      //           Text(
      //             weatherData!.stateName,
      //             style: const TextStyle(
      //                 fontSize: 30, fontWeight: FontWeight.w500),
      //           ),
      //           const Spacer(
      //             flex: 3,
      //           )
      //         ]),
      //       )
    );
  }
}
