import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apiKey = '5a6c750a654961bec62a9fb014bc191c';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    try{
      String url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
      NetworkHelper networkHelper = NetworkHelper(url: url);
      var weatherData = await networkHelper.getWeatherData();
      return weatherData;
    }
    catch (e) {
      print(e);
    }
  }


  Future<dynamic> getLocationWeather() async {
    try{
      Location location = Location();
      await location.getLocation();
      String url = '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
      NetworkHelper networkHelper = NetworkHelper(url: url);
      var weatherData = await networkHelper.getWeatherData();
      return weatherData;
    }
    catch (e) {
      print(e);
    }
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
