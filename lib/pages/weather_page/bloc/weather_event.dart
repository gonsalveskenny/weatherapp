part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class FetchWeatherEvent extends WeatherEvent {}

class ResetWeatherPageEvent extends WeatherEvent {}
