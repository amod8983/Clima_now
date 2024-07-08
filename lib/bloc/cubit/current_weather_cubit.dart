import 'package:bloc/bloc.dart';
import 'package:clima_now/data/dummy_additional_weather_info_data.dart';
import 'package:clima_now/data/dummy_forecast_data.dart';
import 'package:clima_now/data/dummy_location_weather_info_data.dart';
import 'package:clima_now/models/full_weather_model.dart';
import 'package:clima_now/models/weather_forecast.dart';
import 'package:clima_now/services/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import '../../services/location.dart';

part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit()
      : super(
          CurrentWeatherInitial(
            fullWeatherData: FullWeatherModel(
              locationWeatherInfo: dummyLocationWeatherInfo,
              additionalWeatherInfos: dummyAdditionalWeatherInfo,
            ),
            weatherForecastData: dummyForecastData,
          ),
        );

  Future<void> getCurrentWeather(double? lat, double? lon) async {
    if (lat == null && lon == null) {
      Position currentPosition = await GeolocatorService.getCurrentLocation();
      lat = currentPosition.latitude;
      lon = currentPosition.longitude;
    }

    FullWeatherModel tempInfo =
        await WeatherService.getCurrentWeather(lat!, lon!);
    List<WeatherForecastModel> weatherForecasts =
        await WeatherService.getWeatherForecast(lat, lon);

    emit(CurrentWeatherInitial(
        fullWeatherData: tempInfo, weatherForecastData: weatherForecasts));
  }
}
