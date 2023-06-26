import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_update/splash.dart';


import 'logic.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (context) => logic(),child:WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splash(),
    );
  }
}