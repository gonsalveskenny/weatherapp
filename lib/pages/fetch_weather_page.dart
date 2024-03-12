import 'package:flutter/material.dart';

class FetchWeatherPage extends StatelessWidget {
  const FetchWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'weather_page');
          },
          child: const Text('Fetch Weather'),
        ),
      ),
    );
  }
}
