class LocationWeatherInfo {
  const LocationWeatherInfo(
      {required this.locationName,
      required this.currentTemperature,
      required this.dayHighTemperature,
      required this.dayLowTemperature,
      required this.temperatureInfoText,
      required this.airQuality,
      required this.airQualityInfoText});

  final String locationName;
  final double currentTemperature;
  final double dayHighTemperature;
  final double dayLowTemperature;
  final String temperatureInfoText;
  final double airQuality;
  final String airQualityInfoText;

  String get formattedWeatherText {
    return '$temperatureInfoText  ${dayLowTemperature.toInt()}° / ${dayHighTemperature.toInt()}°  Air quality: ${airQuality.toInt()} - $airQualityInfoText';
  }

  String get formattedInfoText {
    return temperatureInfoText[0].toUpperCase() + temperatureInfoText.substring(1);
  }
}
