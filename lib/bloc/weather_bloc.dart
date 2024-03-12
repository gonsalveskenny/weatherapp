import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>(
      (event, emit) async {
        if (event is ResetWeatherPageEvent) {
          emit(WeatherInitial());
        } else if (event is FetchWeatherEvent) {
          emit(WeatherLoading());
          try {
            final weatherService =
                WeatherService(apiKey: '9a5a170fbaad3963cf53ee764e193f77');
            String cityName = await weatherService.getCurrentCity();
            final getWeather = await weatherService.getWeather(cityName);
            emit(WeatherLoaded(weather: getWeather));
          } catch (e) {
            emit(WeatherError(error: e.toString()));
          }
        }
      },
    );
  }
}

String getWeatherAnimation(String? mainCondition) {
  if (mainCondition == null) return 'assets/sunny.json'; // default is sunny

  switch (mainCondition.toLowerCase()) {
    case 'clouds':
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
      return 'assets/cloud.json';
    case 'rain':
    case 'drizzle':
    case 'shower rain':
      return 'assets/rain.json';
    case 'thunderstorm':
      return 'assets/thunder.json';
    case 'clear':
      return 'assets/sunny.json';
    default:
      return 'assets/sunny.json';
  }
}
