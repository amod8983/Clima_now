import 'package:clima_now/models/additional_weather_info_model.dart';
import 'package:clima_now/models/location_weather_info.dart';
import 'package:clima_now/models/weather_forecast.dart';
import 'package:flutter/material.dart';

class WeatherUtils {
  static LocationWeatherInfo getDecodedWeatherInfo(var jsonDecodedData) {
    String name = jsonDecodedData['name'];
    double currentTemp = jsonDecodedData['main']['temp'];
    double dayHigh = jsonDecodedData['main']['temp_max'];
    double dayLow = jsonDecodedData['main']['temp_min'];
    String tempInfo = jsonDecodedData['weather'][0]['description'];
    double airQual = 23;
    String airQualText = 'Good';

    return LocationWeatherInfo(
        locationName: name,
        currentTemperature: double.parse(currentTemp.toStringAsFixed(1)),
        dayHighTemperature: double.parse(dayHigh.toStringAsFixed(1)),
        dayLowTemperature: double.parse(dayLow.toStringAsFixed(1)),
        temperatureInfoText: tempInfo[0].toUpperCase() + tempInfo.substring(1),
        airQuality: airQual,
        airQualityInfoText: airQualText);
  }

  static List<AdditionalWeatherInfoModel> getDecodedAdditionalWeatherInfo(
      var jsonDecodedData) {
    double feelsLike = jsonDecodedData['main']['feels_like'];
    int humidity = jsonDecodedData['main']['humidity'];
    double wind = jsonDecodedData['wind']['speed'] * 1.0;
    int pressure = jsonDecodedData['main']['pressure'];
    int visibility = jsonDecodedData['visibility'] ~/ 1000;

    return [
      const AdditionalWeatherInfoModel(
          paramaterIcon: Icon(
            Icons.sunny,
            color: Colors.yellow,
          ),
          parameterName: 'UV',
          parameterValue: '10 Strong'),
      AdditionalWeatherInfoModel(
          paramaterIcon: const Icon(
            Icons.thermostat,
            color: Colors.red,
          ),
          parameterName: 'Feels like',
          parameterValue: '${feelsLike.toStringAsFixed(1)} °'),
      AdditionalWeatherInfoModel(
          paramaterIcon: const Icon(
            Icons.water_drop,
            color: Color.fromARGB(255, 92, 166, 219),
          ),
          parameterName: 'Humidity',
          parameterValue: '$humidity %'),
      AdditionalWeatherInfoModel(
          paramaterIcon: const Icon(
            Icons.wind_power,
            color: Color.fromARGB(255, 65, 170, 163),
          ),
          parameterName: 'WSW wind',
          parameterValue: '${wind.toStringAsFixed(1)} mph'),
      AdditionalWeatherInfoModel(
          paramaterIcon: const Icon(
            Icons.arrow_downward,
            color: Color.fromARGB(255, 203, 151, 39),
          ),
          parameterName: 'Air pressure',
          parameterValue: '$pressure hPa'),
      AdditionalWeatherInfoModel(
          paramaterIcon: const Icon(
            Icons.visibility_rounded,
            color: Colors.purple,
          ),
          parameterName: 'Visibility',
          parameterValue: '$visibility km'),
    ];
  }

  static List<WeatherForecastModel> getDecodedWeatherForecast(
      var jsonDecodedData) {
    List<WeatherForecastModel> weatherForecasts = [];

    var list = jsonDecodedData['list'];

    final List<Map<String, dynamic>> dailyForecasts = [];
    String lastDate = '';

    for (var entry in list) {
      final String dateTime = entry['dt_txt'];
      final String date = dateTime.split(' ')[0];
      final String time = dateTime.split(' ')[1];
      if (time == '12:00:00' && date != lastDate) {
        dailyForecasts.add(entry);
        lastDate = date;
      }
    }

    for (var dayInfo in dailyForecasts) {
      String date = dayInfo['dt_txt'];
      double dayHigh = double.parse((dayInfo['main']['temp_max']).toString());
      double dayLow = double.parse((dayInfo['main']['temp_min']).toString());
      int weatherId = dayInfo['weather'][0]['id'];
      WeatherForecastModel weatherForecastData = WeatherForecastModel(
        date: date,
        dayHigh: dayHigh,
        dayLow: dayLow,
        weatherId: weatherId,
      );
      weatherForecasts.add(weatherForecastData);
    }
    return weatherForecasts;
  }
}
