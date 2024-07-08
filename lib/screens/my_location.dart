import 'package:clima_now/bloc/cubit/current_weather_cubit.dart';
import 'package:clima_now/widgets/additional_weather_info.dart';
import 'package:clima_now/widgets/primary_weather_info.dart';
import 'package:clima_now/widgets/weather_forecast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyLocationScreen extends StatefulWidget {
  const MyLocationScreen({super.key, this.lon, this.lat});

  final double? lon;
  final double? lat;

  @override
  State<MyLocationScreen> createState() => _MyLocationScreenState();
}

class _MyLocationScreenState extends State<MyLocationScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<CurrentWeatherCubit>()
        .getCurrentWeather(widget.lat, widget.lon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), // Adjust the height
          child: Container(
            color: const Color.fromARGB(255, 100, 102, 104),
            height: 0.5, // Thickness of the border
          ),
        ),
        title: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
          builder: (context, currentWeather) {
            if (currentWeather is CurrentWeatherInitial) {
              return Text(
                currentWeather.fullWeatherData.locationWeatherInfo.locationName,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20),
              );
            } else {
              return Text(
                'Loading current city name',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20),
              );
            }
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrimaryWeatherInfo(),
            WeatherForecast(),
            AdditionalWeatherInfo(),
          ],
        ),
      ),
    );
  }
}
