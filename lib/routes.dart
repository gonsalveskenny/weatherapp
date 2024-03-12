import 'package:flutter/material.dart';
import 'package:weatherapp/pages/weather_page/weather_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'weather_page': (context) => const WeatherPage(),
};
