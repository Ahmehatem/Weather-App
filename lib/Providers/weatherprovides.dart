import 'package:flutter/material.dart';
import 'package:weatherapp/Models/weathermodel.dart';

class WeatherProviders extends ChangeNotifier {
  WeatherModel? _weatherModelData;
  String? cityName;
  set weatherModelData(WeatherModel? weather) {
    _weatherModelData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherModelData => _weatherModelData;
}
