import 'package:clima_now/models/favourite_place_model.dart';
import 'package:clima_now/models/full_weather_model.dart';
import 'package:clima_now/models/location_weather_info.dart';
import 'package:clima_now/services/weather.dart';
import 'package:clima_now/storage/favourite_places_store.dart';
import 'package:clima_now/widgets/favourite_place_item.dart';
import 'package:clima_now/widgets/search_location.dart';
import 'package:flutter/material.dart';

class FavouritePlacesScreen extends StatefulWidget {
  const FavouritePlacesScreen({super.key});

  @override
  State<FavouritePlacesScreen> createState() => _FavouritePlacesScreenState();
}

class _FavouritePlacesScreenState extends State<FavouritePlacesScreen> {
  List<FavouritePlaceModel> _favouritePlaces = [];

  @override
  void initState() {
    super.initState();
    _loadFavouritePlacesData();
  }

  void _loadFavouritePlacesData() async {
    var fetchedData = await FavouritePlacesStore.getFavouritePlaces();
    setState(() {
      _favouritePlaces = fetchedData;
    });
  }

  void _addFavouritePlace() async {
    final result = await showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => const FractionallySizedBox(
        heightFactor: 1,
        child: SearchLocation(),
      ),
    );
    if (result != null) {
      double lon = result.lng;
      double lat = result.lat;
      FullWeatherModel locationData =
          await WeatherService.getCurrentWeather(lat, lon);
      LocationWeatherInfo locationWeatherData =
          locationData.locationWeatherInfo;
      FavouritePlaceModel favoutitePlaceData = FavouritePlaceModel(
          cityName: locationWeatherData.locationName,
          temp: locationWeatherData.currentTemperature,
          airQualityText: 'Air quality: 50 - Excellent',
          temperatureInfoText: locationWeatherData.formattedInfoText,
          lat: lat,
          lon: lon);
      setState(() {
        _favouritePlaces.add(favoutitePlaceData);
      });
      FavouritePlacesStore.saveFavouritePlaces(_favouritePlaces);
    }
  }

  void _removeFavouritePlace(FavouritePlaceModel favouritePlace) {
    setState(() {
      _favouritePlaces.remove(favouritePlace);
    });
    FavouritePlacesStore.saveFavouritePlaces(_favouritePlaces);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourite places',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface, fontSize: 20),
        ),
      ),
      body: ListView.builder(
        itemCount: _favouritePlaces.length,
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(_favouritePlaces[index]),
          background: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 221, 122, 115),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.delete),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          onDismissed: (direction) {
            _removeFavouritePlace(_favouritePlaces[index]);
          },
          child: FavouritePlaceItem(
            favouritePlace: _favouritePlaces[index],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addFavouritePlace,
        backgroundColor: const Color.fromARGB(
            255, 106, 107, 107), // Background color of the button
        foregroundColor: Colors.white, // Color of the icon
        elevation: 4.0,
        mini: true,
        child: const Icon(Icons.add),
      ),
    );
  }
}
