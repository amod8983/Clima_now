import 'package:clima_now/bloc/cubit/current_weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:clima_now/bottom_nav.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(108, 0, 2, 6),
  ),
  textTheme: GoogleFonts.openSansTextTheme(),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) => {runApp(const App())});
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrentWeatherCubit>(
            create: (context) => CurrentWeatherCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const BottomNav(),
      ),
    );
  }
}
