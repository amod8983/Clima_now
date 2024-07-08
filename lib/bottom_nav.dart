import 'package:clima_now/screens/favourite_places.dart';
import 'package:clima_now/screens/my_location.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  void _setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = _currentIndex == 0 ? const MyLocationScreen() : const FavouritePlacesScreen();


    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _setCurrentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.gps_not_fixed),
            activeIcon: Icon(Icons.gps_fixed),
            label: 'My location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            activeIcon: Icon(Icons.star),
            label: 'Favourite places',
          ),
        ],
      ),
    );
  }
}
