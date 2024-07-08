part of 'current_weather_cubit.dart';

@immutable
sealed class CurrentWeatherState {}

final class CurrentWeatherInitial extends CurrentWeatherState {
  CurrentWeatherInitial(
      {required this.fullWeatherData, required this.weatherForecastData});
  final FullWeatherModel fullWeatherData;
  final List<WeatherForecastModel> weatherForecastData;
}

class CurrentWeatherLoaded extends CurrentWeatherState {
  final FullWeatherModel fullWeatherData;
  final List<WeatherForecastModel> weatherForecastData;

  CurrentWeatherLoaded({
    required this.fullWeatherData,
    required this.weatherForecastData,
  });
}
