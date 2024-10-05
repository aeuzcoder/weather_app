import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class ForecastContainer extends StatelessWidget {
  const ForecastContainer({super.key, required this.weather});
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          'assets/1.png',
          scale: 8,
        );
      case >= 300 && < 400:
        return Image.asset(
          'assets/2.png',
          scale: 8,
        );
      case >= 500 && < 600:
        return Image.asset(
          'assets/3.png',
          scale: 8,
        );
      case >= 600 && < 700:
        return Image.asset(
          'assets/4.png',
          scale: 8,
        );
      case >= 700 && < 800:
        return Image.asset(
          'assets/5.png',
          scale: 8,
        );
      case == 800:
        return Image.asset(
          'assets/6.png',
          scale: 8,
        );
      case > 800 && <= 804:
        return Image.asset(
          'assets/7.png',
          scale: 8,
        );
      default:
        return Image.asset(
          'assets/7.png',
          scale: 8,
        );
    }
  }

  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0,
        right: 8,
        top: 10,
        bottom: 10,
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Column(
          children: [
            Text(
              DateFormat('hh:mm a').format(weather.date!).toLowerCase(),
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            getWeatherIcon(weather.weatherConditionCode!),
            Text(
              '${weather.temperature!.celsius!.round().toString()} °C',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
