import 'package:clima_now/widgets/forecast_item.dart';
import 'package:clima_now/models/weather_forecast.dart';
import 'package:flutter/material.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key, required this.weatherForecastData});

  final List<WeatherForecastModel> weatherForecastData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: Card(
          child: SizedBox(
            height: 240,
            child: ListView.builder(
              itemCount: weatherForecastData.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ForecastItem(
                weatherForecast: weatherForecastData[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
