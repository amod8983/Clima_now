import 'package:clima_now/models/weather_forecast.dart';

final now = DateTime.now();
final List<WeatherForecastModel> dummyForecastData = [
  WeatherForecastModel(
      date: now.toString(), dayHigh: 17, dayLow: 23, weatherId: 210),
  WeatherForecastModel(
      date: now.add(const Duration(days: 1)).toString(),
      dayHigh: 19,
      dayLow: 21,
      weatherId: 350),
  WeatherForecastModel(
      date: now.add(const Duration(days: 2)).toString(),
      dayHigh: 17,
      dayLow: 24,
      weatherId: 450),
  WeatherForecastModel(
      date: now.add(const Duration(days: 3)).toString(),
      dayHigh: 21,
      dayLow: 25,
      weatherId: 800),
  WeatherForecastModel(
      date: now.add(const Duration(days: 4)).toString(),
      dayHigh: 18,
      dayLow: 23,
      weatherId: 800),
];
