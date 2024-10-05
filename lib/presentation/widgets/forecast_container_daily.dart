import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class ForecastContainerDaily extends StatelessWidget {
  const ForecastContainerDaily({super.key, required this.weather});
  final Weather weather;
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          'assets/1.png',
          scale: 12,
        );
      case >= 300 && < 400:
        return Image.asset(
          'assets/2.png',
          scale: 12,
        );
      case >= 500 && < 600:
        return Image.asset(
          'assets/3.png',
          scale: 12,
        );
      case >= 600 && < 700:
        return Image.asset(
          'assets/4.png',
          scale: 12,
        );
      case >= 700 && < 800:
        return Image.asset(
          'assets/5.png',
          scale: 12,
        );
      case == 800:
        return Image.asset(
          'assets/6.png',
          scale: 12,
        );
      case > 800 && <= 804:
        return Image.asset(
          'assets/7.png',
          scale: 12,
        );
      default:
        return Image.asset(
          'assets/7.png',
          scale: 12,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 0.5, color: Colors.white))),
        width: double.infinity,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getWeatherIcon(weather.weatherConditionCode!),
            Text(
              DateFormat('EEEE').format(weather.date!).substring(0, 2),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              width: 192,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${weather.tempMin!.celsius!.floor().toString()} °C',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  Container(
                    height: 4,
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.yellow,
                    ),
                  ),
                  Text(
                    '${weather.tempMax!.celsius!.ceil().toString()} °C',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
