import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:clima_now/models/favourite_place_model.dart';

class FavouritePlacesStore {
  static Future<List<FavouritePlaceModel>> getFavouritePlaces() async {
    List<FavouritePlaceModel> fetchedPlaces = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('favouritePlaces');
    if (jsonString != null) {
      List<dynamic> jsonResponse = jsonDecode(jsonString);
      fetchedPlaces = jsonResponse
          .map((item) => FavouritePlaceModel.fromJson(item))
          .toList();
    }
    return fetchedPlaces;
  }

  static void saveFavouritePlaces(
      List<FavouritePlaceModel> favouritePlaces) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString =
        jsonEncode(favouritePlaces.map((item) => item.toJson()).toList());
    prefs.setString('favouritePlaces', jsonString);
  }
}
