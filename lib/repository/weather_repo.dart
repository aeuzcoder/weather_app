import 'package:ae_weather/data/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

class WeatherRepo {
  WeatherFactory wf = WeatherFactory(apiKey);

  Future<Weather> loadCurrentWeather(
      {required double latitude, required double longitude}) async {
    Weather weather = await wf.currentWeatherByLocation(
      latitude,
      longitude,
    );
    return weather;
  }

  Future<List<Weather>> loadDailyForecast(
      {required double latitude, required double longitude}) async {
    List<Weather> weather = await wf.fiveDayForecastByLocation(
      latitude,
      longitude,
    );
    return weather;
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
