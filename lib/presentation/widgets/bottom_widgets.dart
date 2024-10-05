import 'package:ae_weather/presentation/widgets/container_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class BottomWidgets extends StatelessWidget {
  const BottomWidgets({super.key, required this.weather});
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContainerIcons(
                id: 6,
                title: 'Sunset',
                time: DateFormat().add_jm().format(weather.sunset!),
              ),
              ContainerIcons(
                id: 12,
                title: 'Sunrise',
                time: DateFormat().add_jm().format(weather.sunrise!),
              ),
            ],
          ),
          const Divider(
            thickness: 0.3,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContainerIcons(
                id: 13,
                title: 'Temp max',
                time: '${weather.tempMax!.celsius!.round().toString()} °C',
              ),
              ContainerIcons(
                id: 14,
                title: 'Temp min',
                time: '${weather.tempMin!.celsius!.round().toString()} °C',
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
