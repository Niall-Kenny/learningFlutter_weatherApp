import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '4f4f9282ebbcbe8c11206328c399605e';
const openWeatherMapUrl = 'https://samples.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityLocationData(cityName) async {
    NetworkHelper nh =
        NetworkHelper('$openWeatherMapUrl?q=$cityName&appid=$apiKey');

    var weatherData = await nh.getData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper nh = NetworkHelper(
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');

    var weatherData = await nh.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
