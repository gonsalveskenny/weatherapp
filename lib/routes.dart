import 'package:flutter/material.dart';
import 'package:weatherapp/pages/fetch_weather_page.dart';
import 'package:weatherapp/pages/weather_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'weather_page': (context) => const WeatherPage(),
  'fetch_weather_page': (context) => const FetchWeatherPage(),
};
