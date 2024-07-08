class FavouritePlaceModel {
  FavouritePlaceModel({
    required this.cityName,
    required this.temp,
    required this.airQualityText,
    required this.temperatureInfoText,
    required this.lat,
    required this.lon,
  });

  final String cityName;
  final double temp;
  final String airQualityText;
  final String temperatureInfoText;
  final double lat;
  final double lon;

  factory FavouritePlaceModel.fromJson(Map<String, dynamic> json) {
    return FavouritePlaceModel(
      cityName: json['cityName'],
      temp: json['temp'],
      airQualityText: json['airQualityText'],
      temperatureInfoText: json['temperatureInfoText'],
      lat: json['lat'],
      lon: json['lon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'temp': temp,
      'airQualityText': airQualityText,
      'temperatureInfoText': temperatureInfoText,
      'lat': lat,
      'lon': lon,
    };
  }
}
