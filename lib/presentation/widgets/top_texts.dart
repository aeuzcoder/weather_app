import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class TopTexts extends StatelessWidget {
  const TopTexts({super.key, required this.weather});
  final Weather weather;
  String getDayTag() {
    final hour = weather.date!.hour;
    log(hour.toString());
    if (hour >= 6 && hour < 10) {
      return 'Hayrli tong';
    }
    if (hour >= 10 && hour < 17) {
      return 'Hayrli kun';
    } else {
      return 'Hayrli kech';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📍 ${weather.areaName.toString()}',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          getDayTag(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
