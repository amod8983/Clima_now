import 'package:clima_now/models/weather_forecast.dart';
import 'package:flutter/material.dart';

class ForecastItem extends StatelessWidget {
  const ForecastItem({super.key, required this.weatherForecast});
  final WeatherForecastModel weatherForecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  weatherForecast.formattedDate,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                )
              ],
            ),
          ),
          weatherForecast.weatherIcon,
          Text(
            '${weatherForecast.dayLow.round()}° / ${weatherForecast.dayHigh.round()}°',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
          )
        ],
      ),
    );
  }
}
