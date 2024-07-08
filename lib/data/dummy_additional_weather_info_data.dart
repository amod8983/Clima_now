import 'package:clima_now/models/additional_weather_info_model.dart';
import 'package:flutter/material.dart';

const List<AdditionalWeatherInfoModel> dummyAdditionalWeatherInfo = [
  AdditionalWeatherInfoModel(
      paramaterIcon: Icon(
        Icons.sunny,
        color: Colors.yellow,
      ),
      parameterName: 'UV',
      parameterValue: '10 Strong'),
  AdditionalWeatherInfoModel(
      paramaterIcon: Icon(
        Icons.thermostat,
        color: Colors.red,
      ),
      parameterName: 'Feels like',
      parameterValue: '31 °'),
  AdditionalWeatherInfoModel(
      paramaterIcon: Icon(
        Icons.water_drop,
        color: Color.fromARGB(255, 92, 166, 219),
      ),
      parameterName: 'Humidity',
      parameterValue: '68 %'),
  AdditionalWeatherInfoModel(
      paramaterIcon: Icon(
        Icons.wind_power,
        color: Color.fromARGB(255, 65, 170, 163),
      ),
      parameterName: 'WSW wind',
      parameterValue: '14 mph'),
  AdditionalWeatherInfoModel(
      paramaterIcon: Icon(
        Icons.arrow_downward,
        color: Color.fromARGB(255, 203, 151, 39),
      ),
      parameterName: 'Air pressure',
      parameterValue: '1011 hPa'),
  AdditionalWeatherInfoModel(
      paramaterIcon: Icon(
        Icons.visibility_rounded,
        color: Colors.purple,
      ),
      parameterName: 'Visibility',
      parameterValue: '8 km'),
];
