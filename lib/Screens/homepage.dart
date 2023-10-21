// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Models/weathermodel.dart';
import 'package:weatherapp/Providers/weatherprovides.dart';
import 'package:weatherapp/Screens/searchpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? data;

  String? city;

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData;
    weatherData = Provider.of<WeatherProviders>(context).weatherModelData;
    // Provider.of<WeatherProviders>(context).weatherModelData!.weatherState =
    //     'Clear';
    return Scaffold(
      body: weatherData == null
          ? Stack(
              fit: StackFit.expand,
              children: [
                const Image(
                  image: AssetImage(
                      'assets/images/photo-1516912481808-3406841bd33c.jpg'),
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
                      padding:
                          const EdgeInsets.only(top: 58.0, left: 10, right: 10),
                      child: Container(
                        width: double.infinity,
                        height: 350,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(172, 49, 49, 49),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return SearchPage();
                                          },
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.search_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    )),
                              ],
                            ),
                            const Spacer(),
                            const Image(
                              image: AssetImage('assets/images/pngegg.png'),
                              height: 200,
                              width: 200,
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            const Text(
                              'No City Selceted',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 28),
                        child: Container(
                          width: double.infinity,
                          // height: 400,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(172, 49, 49, 49),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Search Now For City ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          : Stack(
              fit: StackFit.expand,
              children: [
                const Image(
                  image: AssetImage(
                    'assets/images/photo-1516912481808-3406841bd33c.jpg',
                  ),
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
                      padding:
                          const EdgeInsets.only(top: 58.0, left: 10, right: 10),
                      child: Container(
                        width: double.infinity,
                        height: 350,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(172, 49, 49, 49),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return SearchPage();
                                          },
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.search_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    )),
                              ],
                            ),
                            const Spacer(),
                            const Image(
                              image: AssetImage('assets/images/pngegg.png'),
                              height: 200,
                              width: 200,
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            Text(
                              weatherData?.city ?? 'No City',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 28),
                        child: Container(
                          width: double.infinity,
                          // height: 400,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(172, 49, 49, 49),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              const Spacer(flex: 1),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: weatherData!.getThemeColor(),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          weatherData!.getImage(),
                                          height: 50,
                                          width: 50,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              '${weatherData?.temp.toInt()}' ??
                                                  'NO TEMP',
                                              style: TextStyle(
                                                color: weatherData!
                                                    .getThemeColor(),
                                                fontSize: 90,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              weatherData.weatherState,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(flex: 1),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Container(
                                    width: double.infinity,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: weatherData!.getThemeColor(),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'MAX TEMP: ${weatherData?.maxTemp.toInt()}' ??
                                            'NO TEMP',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Container(
                                    width: double.infinity,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: weatherData!.getThemeColor(),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Min TEMP: ${weatherData?.minTemp.toInt()}' ??
                                            'NO TEMP',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'UpDated in : ${weatherData.date}',
                                style: TextStyle(
                                    color: weatherData!.getThemeColor(),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
