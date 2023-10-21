import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Providers/weatherprovides.dart';
import 'package:weatherapp/Screens/homepage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return WeatherProviders();
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:
            Provider.of<WeatherProviders>(context).weatherModelData == null
                ? Colors.orange
                : Provider.of<WeatherProviders>(context)
                    .weatherModelData!
                    .getThemeColor(),
      ),
      home: const HomePage(),
    );
  }
}
