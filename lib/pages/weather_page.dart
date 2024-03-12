import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/bloc/weather_bloc.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        BlocProvider.of<WeatherBloc>(context).add(ResetWeatherPageEvent());
      },
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return Scaffold(
              body: Center(
                child: OutlinedButton(
                  onPressed: () {
                    BlocProvider.of<WeatherBloc>(context)
                        .add(FetchWeatherEvent());
                  },
                  child: const Text('Fetch Weather'),
                ),
              ),
            );
          } else if (state is WeatherLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is WeatherLoaded) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // city name
                    loadingCity(state.weather),

                    // animation
                    weatherLottieAnimation(state.weather),

                    // temperature
                    temperatureDisplay(state.weather),

                    // weather condition
                    weatherCondition(state.weather),
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          }
        },
      ),
    );
  }

  Center weatherLottieAnimation(Weather weather) {
    return Center(
      child: Lottie.asset(getWeatherAnimation(weather.mainCondition)),
    );
  }

  Text weatherCondition(Weather weather) => Text(weather.mainCondition);

  Text temperatureDisplay(Weather weather) =>
      Text('${weather.temperature.round()}*C');

  Text loadingCity(Weather weather) {
    return Text(weather.cityName);
  }
}
