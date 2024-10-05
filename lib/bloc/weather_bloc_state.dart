part of 'weather_bloc.dart';

sealed class WeatherBlocState {}

final class WeatherLoadingState extends WeatherBlocState {}

final class WeatherErrorState extends WeatherBlocState {}

final class WeatherLoadedState extends WeatherBlocState {
  final Weather weather;
  final List<Weather> weatherOfFiveDays;
  final List<Weather> weatherOfOneDays;
  WeatherLoadedState({
    required this.weather,
    required this.weatherOfFiveDays,
    required this.weatherOfOneDays,
  });
}

final class WeatherStartState extends WeatherBlocState {}
