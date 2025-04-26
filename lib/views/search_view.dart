import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search City',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.fetchWeather(value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 10),
              label: Text('Search'),
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter City Name',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color.fromARGB(255, 255, 0, 0),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
