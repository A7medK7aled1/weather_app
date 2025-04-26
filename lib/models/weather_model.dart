// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherModel {
  final String cityName;
  final String date;
  final String? image;
  final num temp;
  final num maxTemp;
  final num minTemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      cityName: json["location"]["name"],
      date: json["current"]["last_updated"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
    );
  }
}
