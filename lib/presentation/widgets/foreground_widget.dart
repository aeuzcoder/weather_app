// ignore_for_file: prefer_const_constructors

import 'package:ae_weather/presentation/widgets/bottom_widgets.dart';
import 'package:ae_weather/presentation/widgets/center_widgets.dart';
import 'package:ae_weather/presentation/widgets/forecast_widget.dart';
import 'package:ae_weather/presentation/widgets/top_texts.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class ForegroundPage extends StatelessWidget {
  const ForegroundPage({super.key, required this.weather});
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 80,
        left: 36,
        right: 36,
        bottom: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTexts(weather: weather),
            CenterWidgets(weather: weather),
            BottomWidgets(weather: weather),
            ForecastWidget(weather: weather),
          ],
        ),
      ),
    );
  }
}
