import 'package:clima_now/data/dummy_additional_weather_info_data.dart';
import 'package:clima_now/data/dummy_forecast_data.dart';
import 'package:clima_now/data/dummy_location_weather_info_data.dart';
import 'package:clima_now/models/additional_weather_info_model.dart';
import 'package:clima_now/models/full_weather_model.dart';
import 'package:clima_now/models/location_weather_info.dart';
import 'package:clima_now/models/weather_forecast.dart';
import 'package:clima_now/services/location.dart';
import 'package:clima_now/services/weather.dart';
import 'package:clima_now/widgets/additional_weather_info.dart';
import 'package:clima_now/widgets/primary_weather_info.dart';
import 'package:clima_now/widgets/weather_forecast.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyLocationScreen extends StatefulWidget {
  const MyLocationScreen({super.key, this.lon, this.lat});

  final double? lon;
  final double? lat;

  @override
  State<MyLocationScreen> createState() => _MyLocationScreenState();
}

class _MyLocationScreenState extends State<MyLocationScreen> {
  late LocationWeatherInfo _currentLocationWeatherInfo;
  late List<AdditionalWeatherInfoModel> _additionalWeatherInfos;
  late List<WeatherForecastModel> _weatherForecasteData = [];

  @override
  void initState() {
    super.initState();
    _currentLocationWeatherInfo = dummyLocationWeatherInfo;
    _additionalWeatherInfos = dummyAdditionalWeatherInfo;
    _weatherForecasteData = dummyForecastData;
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    double lat;
    double lon;

    if (widget.lat != null && widget.lon != null) {
      lat = widget.lat!;
      lon = widget.lon!;
    } else {
      Position currentPosition = await GeolocatorService.getCurrentLocation();
      lat = currentPosition.latitude;
      lon = currentPosition.longitude;
    }

    FullWeatherModel tempInfo =
        await WeatherService.getCurrentWeather(lat, lon);
    List<WeatherForecastModel> weatherForecasts =
        await WeatherService.getWeatherForecast(lat, lon);
    if (mounted) {
      setState(() {
        _currentLocationWeatherInfo = tempInfo.locationWeatherInfo;
        _additionalWeatherInfos = tempInfo.additionalWeatherInfos;
        _weatherForecasteData = weatherForecasts;
      });
    }
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
        title: Text(
          _currentLocationWeatherInfo.locationName,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrimaryWeatherInfo(
              locationWeatherInfo: _currentLocationWeatherInfo,
            ),
            WeatherForecast(
              weatherForecastData: _weatherForecasteData,
            ),
            AdditionalWeatherInfo(
              additionalWeatherDatas: _additionalWeatherInfos,
            ),
          ],
        ),
      ),
    );
  }
}
