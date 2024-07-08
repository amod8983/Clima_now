import 'dart:convert';
import 'package:clima_now/data/dummy_additional_weather_info_data.dart';
import 'package:clima_now/data/dummy_location_weather_info_data.dart';
import 'package:clima_now/models/full_weather_model.dart';
import 'package:clima_now/models/weather_forecast.dart';
import 'package:clima_now/utils/weather_utils.dart';
import 'package:http/http.dart' as http;

const String _kOpenWeatherAPIKey = "5049b88e3c9d08a95165d93a61b9cb42";

class WeatherService {
  static Future<FullWeatherModel> getCurrentWeather(double lat, double lon) async {
    try {

      Uri currentWeatherUrl = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$_kOpenWeatherAPIKey&units=metric');
      var response = await http.get(currentWeatherUrl);

      if (response.statusCode == 200) {
        String responseData = response.body;
        var decodedData = jsonDecode(responseData);
        print(decodedData);

        return FullWeatherModel(
          locationWeatherInfo: WeatherUtils.getDecodedWeatherInfo(decodedData),
          additionalWeatherInfos:
              WeatherUtils.getDecodedAdditionalWeatherInfo(decodedData),
        );
      } else {
        print(response.statusCode);
        return FullWeatherModel(
          locationWeatherInfo: dummyLocationWeatherInfo,
          additionalWeatherInfos: dummyAdditionalWeatherInfo,
        );
      }
    } catch (e) {
      print(e);
      return FullWeatherModel(
        locationWeatherInfo: dummyLocationWeatherInfo,
        additionalWeatherInfos: dummyAdditionalWeatherInfo,
      );
    }
  }

  static Future<List<WeatherForecastModel>> getWeatherForecast(
      double lat, double lon) async {
    List<WeatherForecastModel> weatherForecastdata = [];
    try {
      Uri weatherForecastUrl = Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$_kOpenWeatherAPIKey&units=metric');
      var response = await http.get(weatherForecastUrl);
      if (response.statusCode == 200) {
        String responseData = response.body;
        var decodedData = jsonDecode(responseData);
        return WeatherUtils.getDecodedWeatherForecast(decodedData);
      } else {
        return weatherForecastdata;
      }
    } catch (e) {
      return weatherForecastdata;
    }
  }
}
