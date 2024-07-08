import 'package:clima_now/models/location_weather_info.dart';
import 'package:flutter/material.dart';

class PrimaryWeatherInfo extends StatelessWidget {
  const PrimaryWeatherInfo({super.key, required this.locationWeatherInfo});

  final LocationWeatherInfo locationWeatherInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 28, 40, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${locationWeatherInfo.currentTemperature}°",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),Text(
                  locationWeatherInfo.formattedWeatherText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                ),
            ],
          ),
        ),
    );
  }
}
