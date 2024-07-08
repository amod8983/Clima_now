import 'package:clima_now/bloc/cubit/current_weather_cubit.dart';
import 'package:clima_now/widgets/forecast_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: Card(
          child: SizedBox(
            height: 240,
            child: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
                builder: (context, currentWeather) {
              if (currentWeather is CurrentWeatherInitial) {
                return ListView.builder(
                  itemCount: currentWeather.weatherForecastData.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ForecastItem(
                    weatherForecast: currentWeather.weatherForecastData[index],
                  ),
                );
              } else {
                return const Text('Loading forecast data');
              }
            }),
          ),
        ),
      ),
    );
  }
}
