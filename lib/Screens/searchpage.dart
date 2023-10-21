// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Models/weathermodel.dart';
import 'package:weatherapp/Providers/weatherprovides.dart';
import 'package:weatherapp/Screens/homepage.dart';
import 'package:weatherapp/services/weatherservice.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        const Image(
          image:
              AssetImage('assets/images/photo-1516912481808-3406841bd33c.jpg'),
          fit: BoxFit.cover,
        ),
        Container(
          color: const Color.fromARGB(66, 32, 32, 7),
          height: double.infinity,
          width: double.infinity,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: 'Enter CityName',
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                  labelText: 'Search For City',
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onSubmitted: (data) async {
                  // ignore: unused_local_variable
                  String cityName = data;
                  WeatherServices service = WeatherServices();
                  WeatherModel? weatherModel =
                      await service.getWeather(cityName: cityName);
                  Provider.of<WeatherProviders>(context, listen: false)
                      .weatherModelData = weatherModel;
                  Provider.of<WeatherProviders>(context, listen: false)
                      .cityName = cityName;
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ],
    ));
  }
}
