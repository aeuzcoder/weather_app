import 'dart:developer';
import 'package:ae_weather/repository/weather_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBloc() : super(WeatherStartState()) {
    on<WeatherLoadEvent>((event, emit) async {
      try {
        emit(WeatherLoadingState());
        WeatherRepo weatherRepo = WeatherRepo();
        Position position = await weatherRepo.determinePosition();
        Weather weather = await weatherRepo.loadCurrentWeather(
          latitude: position.latitude,
          longitude: position.longitude,
        );
        List<Weather> weatherOfDays = await weatherRepo.loadDailyForecast(
          latitude: position.latitude,
          longitude: position.longitude,
        );
        List<Weather> weatherOfFiveDays = [];
        List<Weather> weatherOfOneDay = [];
        for (var we in weatherOfDays) {
          final String time = DateFormat('hh:mm a').format(we.date!);
          DateTime today = DateTime.now();
          if (DateFormat('EEEE').format(we.date!) ==
              DateFormat('EEEE').format(today)) {
            weatherOfOneDay.add(we);
          }
          if (time.contains('11:00 AM')) {
            weatherOfFiveDays.add(we);
          } else {
            continue;
          }
        }
        emit(
          WeatherLoadedState(
              weather: weather,
              weatherOfFiveDays: weatherOfFiveDays,
              weatherOfOneDays: weatherOfOneDay),
        );
      } catch (e) {
        emit(WeatherErrorState());
        log('Xatolik: $e');
        Exception(e);
      }
    });
  }
}
