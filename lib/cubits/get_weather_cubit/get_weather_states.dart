import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class NoWeatherStae extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  final String errorMessage;
  WeatherFailureState({required this.errorMessage});
}
