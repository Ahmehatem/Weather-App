import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/Models/weathermodel.dart';

class WeatherServices {
  Future<WeatherModel> getWeather({required String cityName}) async {
    String apiKey = '39e5a700fb1c46c79a8223142232107';
    String baseUrl = 'http://api.weatherapi.com/v1';
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weatherModel = WeatherModel.fromJson(data);

    return weatherModel;
  }
}
//39e5a700fb1c46c79a8223142232107
//http://api.weatherapi.com/v1/forecast.json?key=39e5a700fb1c46c79a8223142232107&q=London&days=1&aqi=no&alerts=no