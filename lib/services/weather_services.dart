import 'dart:developer';

import 'package:weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherServices {
  final Dio dio = Dio();
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "56894a26fd364409959114521251501";

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error']['message'] ??
          'oops there is an error, try agin later !';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('error try later');
    }
  }
}
