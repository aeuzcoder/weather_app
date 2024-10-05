// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ae_weather/bloc/weather_bloc.dart';
import 'package:ae_weather/presentation/widgets/forecast_container.dart';
import 'package:ae_weather/presentation/widgets/forecast_container_daily.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({super.key, required this.weather});
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Forecast',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2,
                ),
              ),
              const Divider(
                thickness: 0.3,
              ),
              //forecast of hourly
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: BlocBuilder<WeatherBloc, WeatherBlocState>(
                    builder: (context, state) {
                      if (state is WeatherLoadedState) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.weatherOfOneDays.length,
                              itemBuilder: (context, index) {
                                final weather = state.weatherOfOneDays[index];
                                return ForecastContainer(
                                  weather: weather,
                                );
                              }),
                        );
                      }
                      return SizedBox();
                    },
                  ),
                ),
              ),

              //forecast of daily

              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  height: 275,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: BlocBuilder<WeatherBloc, WeatherBlocState>(
                    builder: (context, state) {
                      if (state is WeatherLoadedState) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(4),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return ForecastContainerDaily(
                              weather: state.weatherOfFiveDays[index],
                            );
                          },
                        );
                      }
                      return SizedBox();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
