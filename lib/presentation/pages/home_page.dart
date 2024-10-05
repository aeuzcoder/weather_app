import 'package:ae_weather/bloc/weather_bloc.dart';
import 'package:ae_weather/presentation/widgets/background_widget.dart';
import 'package:ae_weather/presentation/widgets/foreground_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const BackgroundPage(),
          BlocBuilder<WeatherBloc, WeatherBlocState>(
            builder: (context, state) {
              //ERROR
              if (state is WeatherErrorState) {
                return const Center(
                  child: FittedBox(
                    child: Text(
                      'Internet bilan aloqa yoq',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }

              if (state is WeatherLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              }
              //LOADED
              if (state is WeatherLoadedState) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ForegroundPage(
                    weather: state.weather,
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
