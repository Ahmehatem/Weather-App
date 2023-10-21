import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherState;
  String city;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
    required this.city,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var josnData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      date: data['forecast']['forecastday'][0]['date'],
      temp: josnData['avgtemp_c'],
      maxTemp: josnData['maxtemp_c'],
      minTemp: josnData['mintemp_c'],
      weatherState: data['current']['condition']['text'],
      city: data['location']['name'],
    );
  }
  String getImage() {
    if (weatherState == 'Clear') {
      return 'assets/images/Clear.png';
    } else if (weatherState == 'Sunny') {
      return 'assets/images/sunny.png';
    } else if (weatherState == 'Cloudy' ||
        weatherState == 'Partly cloudy' ||
        weatherState == 'Overcast') {
      return 'assets/images/cloudy.png';
    } else if (weatherState == 'Mist' ||
        weatherState == 'Fog' ||
        weatherState == 'Freezing fog' ||
        weatherState == 'Patchy light drizzle' ||
        weatherState == 'Light drizzle' ||
        weatherState == 'Light drizzle' ||
        weatherState == 'Freezing drizzle' ||
        weatherState == 'Heavy freezing drizzle') {
      return 'assets/images/Mist.png';
    } else if (weatherState == 'Patchy rain possible' ||
        weatherState == 'Patchy light rain' ||
        weatherState == 'Light rain' ||
        weatherState == 'Moderate rain at times' ||
        weatherState == 'Moderate rain' ||
        weatherState == 'Heavy rain at times' ||
        weatherState == 'Heavy rain' ||
        weatherState == 'Moderate or heavy freezing rain' ||
        weatherState == 'Light rain shower' ||
        weatherState == 'Moderate or heavy rain shower' ||
        weatherState == 'Torrential rain shower') {
      return 'assets/images/rain.png';
    } else if (weatherState == 'Patchy snow possible' ||
        weatherState == 'Patchy sleet possible' ||
        weatherState == 'Patchy freezing drizzle possible' ||
        weatherState == 'Blowing snow' ||
        weatherState == 'Blizzard' ||
        weatherState == 'Light sleet' ||
        weatherState == 'Moderate or heavy sleet ' ||
        weatherState == 'Patchy light snow' ||
        weatherState == 'Light snow' ||
        weatherState == 'Patchy moderate snow' ||
        weatherState == 'Moderate snow' ||
        weatherState == 'Patchy heavy snow' ||
        weatherState == 'ight sleet showers' ||
        weatherState == 'Moderate or heavy sleet showers' ||
        weatherState == 'Moderate or heavy showers of ice pellets' ||
        weatherState == 'Patchy light snow with thunder' ||
        weatherState == 'Moderate or heavy snow with thunder' ||
        weatherState == 'Heavy snow') {
      return 'assets/images/snow.png';
    } else if (weatherState == 'Thundery outbreaks possible') {
      return 'assets/images/Thunder.png';
    } else {
      return 'assets/images/else.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherState == 'Clear') {
      return Colors.blue;
    } else if (weatherState == 'Sunny') {
      return Colors.orange;
    } else if (weatherState == 'Cloudy' ||
        weatherState == 'Partly cloudy' ||
        weatherState == 'Overcast') {
      return Colors.grey;
    } else if (weatherState == 'Mist' ||
        weatherState == 'Fog' ||
        weatherState == 'Freezing fog' ||
        weatherState == 'Patchy light drizzle' ||
        weatherState == 'Light drizzle' ||
        weatherState == 'Light drizzle' ||
        weatherState == 'Freezing drizzle' ||
        weatherState == 'Heavy freezing drizzle') {
      return Colors.grey;
    } else if (weatherState == 'Patchy rain possible' ||
        weatherState == 'Patchy light rain' ||
        weatherState == 'Light rain' ||
        weatherState == 'Moderate rain at times' ||
        weatherState == 'Moderate rain' ||
        weatherState == 'Heavy rain at times' ||
        weatherState == 'Heavy rain' ||
        weatherState == 'Moderate or heavy freezing rain' ||
        weatherState == 'Light rain shower' ||
        weatherState == 'Moderate or heavy rain shower' ||
        weatherState == 'Torrential rain shower') {
      return Colors.grey;
    } else if (weatherState == 'Patchy snow possible' ||
        weatherState == 'Patchy sleet possible' ||
        weatherState == 'Patchy freezing drizzle possible' ||
        weatherState == 'Blowing snow' ||
        weatherState == 'Blizzard' ||
        weatherState == 'Light sleet' ||
        weatherState == 'Moderate or heavy sleet ' ||
        weatherState == 'Patchy light snow' ||
        weatherState == 'Light snow' ||
        weatherState == 'Patchy moderate snow' ||
        weatherState == 'Moderate snow' ||
        weatherState == 'Patchy heavy snow' ||
        weatherState == 'ight sleet showers' ||
        weatherState == 'Moderate or heavy sleet showers' ||
        weatherState == 'Moderate or heavy showers of ice pellets' ||
        weatherState == 'Patchy light snow with thunder' ||
        weatherState == 'Moderate or heavy snow with thunder' ||
        weatherState == 'Heavy snow') {
      return Colors.grey;
    } else if (weatherState == 'Thundery outbreaks possible') {
      return Colors.grey;
    } else {
      return Colors.orange;
    }
  }
}
