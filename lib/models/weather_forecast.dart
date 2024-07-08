import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherForecastModel {
  const WeatherForecastModel({
    required this.date,
    required this.dayHigh,
    required this.dayLow,
    required this.weatherId,
  });

  final String date;
  final double dayHigh;
  final double dayLow;
  final int weatherId;

  String get formattedDate {
    DateTime currentDate = DateTime.parse(date);

    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);

    String dayIndicator;
    if (currentDate.year == today.year &&
        currentDate.month == today.month &&
        currentDate.day == today.day) {
      dayIndicator = "Today";
    } else if (currentDate.year == tomorrow.year &&
        currentDate.month == tomorrow.month &&
        currentDate.day == tomorrow.day) {
      dayIndicator = "Tomorrow";
    } else {
      dayIndicator = "";
    }

    String formattedDate = DateFormat("d MMM").format(currentDate);
    if (dayIndicator.isNotEmpty) {
      formattedDate += "  $dayIndicator";
    } else {
      String weekday = DateFormat("EEE").format(currentDate);
      formattedDate += "  $weekday";
    }

    return formattedDate;
  }

  Icon get weatherIcon {
    if (weatherId < 300) {
      return const Icon(Icons.cloud, color: Colors.grey);
    } else if (weatherId < 400) {
      return const Icon(Icons.cloudy_snowing, color: Colors.grey);
    } else if (weatherId < 600) {
      return const Icon(Icons.thunderstorm, color: Colors.blueAccent);
    } else if (weatherId < 700) {
      return const Icon(Icons.cloudy_snowing, color: Colors.white);
    } else if (weatherId < 800) {
      return const Icon(Icons.sunny_snowing, color: Colors.white);
    } else if (weatherId == 800) {
      return const Icon(Icons.sunny, color: Colors.yellow);
    } else if (weatherId <= 804) {
      return const Icon(Icons.cloud_queue, color: Colors.grey);
    } else {
      return const Icon(Icons.device_unknown, color: Colors.red);
    }
  }
}
