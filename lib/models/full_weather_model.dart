import 'package:clima_now/models/additional_weather_info_model.dart';
import 'package:clima_now/models/location_weather_info.dart';

class FullWeatherModel {
  FullWeatherModel({
    required this.locationWeatherInfo,
    required this.additionalWeatherInfos,
  });

  final LocationWeatherInfo locationWeatherInfo;
  final List<AdditionalWeatherInfoModel> additionalWeatherInfos;
}
