import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import 'package:weather_update/ui.dart';
class splash extends StatefulWidget {
  const splash({super.key});
 

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
   @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => WeatherScreen(),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212227),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
        Lottie.asset("ima/lotti.json"),
        Text("Weather News",style: TextStyle(color: Colors.blueAccent,fontSize: 35,fontWeight: FontWeight.bold),)

      ]),
    );
  }
}