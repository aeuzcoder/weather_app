import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class CenterWidgets extends StatelessWidget {
  const CenterWidgets({super.key, required this.weather});
  final Weather weather;
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('assets/1.png');
      case >= 300 && < 400:
        return Image.asset('assets/2.png');
      case >= 500 && < 600:
        return Image.asset('assets/3.png');
      case >= 600 && < 700:
        return Image.asset('assets/4.png');
      case >= 700 && < 800:
        return Image.asset('assets/5.png');
      case == 800:
        return Image.asset('assets/6.png');
      case > 800 && <= 804:
        return Image.asset('assets/7.png');
      default:
        return Image.asset('assets/7.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        getWeatherIcon(weather.weatherConditionCode!),
        Text(
          '${weather.temperature!.celsius!.round().toString()}°C',
          style: const TextStyle(
              color: Colors.white, fontSize: 56, fontWeight: FontWeight.bold),
        ),
        Text(
          weather.weatherMain.toString().toUpperCase(),
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
        ),
        Text(
          DateFormat('EEEE dd   ·  ').add_jm().format(weather.date!),
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
