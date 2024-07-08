import 'package:clima_now/bloc/cubit/current_weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrimaryWeatherInfo extends StatelessWidget {
  const PrimaryWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 28, 40, 50),
        child: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
          builder: (context, currentWeather) {
            if (currentWeather is CurrentWeatherInitial) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${currentWeather.fullWeatherData.locationWeatherInfo.currentTemperature}°",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    currentWeather.fullWeatherData.locationWeatherInfo.formattedWeatherText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              );
            } else {
              return const Text('Loading data');
            }
          },
        ),
      ),
    );
  }
}
