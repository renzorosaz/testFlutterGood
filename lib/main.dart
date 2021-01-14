import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_goodm/viewmodels/weather_provider.dart';
import 'package:prueba_goodm/views/home_view.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ListenableProvider<WeatherProvider>(create: (_) => WeatherProvider(),)
        ],
        child: HomeView())
    );
  }
}