import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: getTheme(BlocProvider.of<GetWeatherCubit>(context)
                  .weatherModel
                  ?.weatherCondition),
              useMaterial3: false,
            ),
            home: HomeView(),
          ),
        ),
      ),
    );
  }
}

MaterialColor getTheme(String? condition) {
  if (condition == null) return Colors.blue;
  condition = condition.trimRight();
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.yellow;
    case "Partly Cloudy":
      return Colors.blueGrey;
    case "Cloudy":
    case "Overcast":
      return Colors.grey;
    case "Mist":
    case "Fog":
    case "Freezing Fog":
      return Colors.blueGrey;
    case "Patchy Rain Possible":
    case "Patchy Light Drizzle":
    case "Light Drizzle":
    case "Patchy Light Rain":
    case "Light Rain":
    case "Moderate Rain At Times":
    case "Moderate Rain":
    case "Heavy Rain At Times":
    case "Heavy Rain":
    case "Light Freezing Rain":
    case "Moderate Or Heavy Freezing Rain":
    case "Light Rain Shower":
    case "Moderate Or Heavy Rain Shower":
    case "Torrential Rain Shower":
      return Colors.blue;
    case "Patchy Snow Possible":
    case "Patchy Light Snow":
    case "Light Snow":
    case "Patchy Moderate Snow":
    case "Moderate Snow":
    case "Patchy Heavy Snow":
    case "Heavy Snow":
    case "Light Snow Showers":
    case "Moderate Or Heavy Snow Showers":
      return Colors.lightBlue;
    case "Patchy Sleet Possible":
    case "Patchy Freezing Drizzle Possible":
    case "Freezing Drizzle":
    case "Heavy Freezing Drizzle":
    case "Light Sleet":
    case "Moderate Or Heavy Sleet":
    case "Light Sleet Showers":
    case "Moderate Or Heavy Sleet Showers":
    case "Blowing Snow":
    case "Blizzard":
    case "Ice Pellets":
    case "Light Showers Of Ice Pellets":
    case "Moderate Or Heavy Showers Of Ice Pellets":
      return Colors.cyan;
    case "Thundery Outbreaks Possible":
    case "Patchy Light Rain With Thunder":
    case "Moderate Or Heavy Rain With Thunder":
    case "Patchy Light Snow With Thunder":
    case "Moderate Or Heavy Snow With Thunder":
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
