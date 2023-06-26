import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class logic extends ChangeNotifier{
   
 
 
  String city = '';
  String temperature = '';
  String description = '';
  String humidity = '';
  String windSpeed = '';
  
  String errorMessage = '';

  
  String ttemperature = '';
  String tdescription = '';
  String thumidity = '';
  String twindSpeed = '';
  String terrorMessage = '';

  FocusNode focusNode = FocusNode();

  void fetchWeatherData(String cityName) async {
    final apiKey = '69702a08d16686a8bd0613bf48c05bd0'; // Replace with your OpenWeatherMap API key
    final apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final weatherData = jsonDecode(response.body);
       
      
        city = weatherData['name'];
        temperature = weatherData['main']['temp'].toString();
        description = weatherData['weather'][0]['description'];
        humidity = weatherData['main']['humidity'].toString();
        windSpeed = weatherData['wind']['speed'].toString();
       
       
        errorMessage = '';
         
        
      
    } else {
      
     
        city = '';
        temperature = '';
        description = '';
        humidity = '';
        windSpeed = '';
        
       
        errorMessage = 'No City Found With This Name.';
        
      
    }  
    notifyListeners();
    }



    



      void fetchTomorrowWeatherData(String cityName) async {
    final apiKey = '69702a08d16686a8bd0613bf48c05bd0'; // Replace with your OpenWeatherMap API key
    final apiUrl =
        'http://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey&units=metric';
        

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final weatherData = jsonDecode(response.body);

      final tomorrowData = weatherData['list'][1]; // Fetching data for tomorrow (index 1)

    
       ttemperature = tomorrowData['main']['temp'].toString();
        tdescription = tomorrowData['weather'][0]['description'];
        thumidity = tomorrowData['main']['humidity'].toString();
        twindSpeed = tomorrowData['wind']['speed'].toString();
        terrorMessage = '';
    
    } else {
    
        ttemperature = '';
        tdescription = '';
        thumidity = '';
        twindSpeed = '';
        terrorMessage = 'Failed to fetch tomorrow\'s weather.';
      
    }notifyListeners();
  }

  

  

 

  
}


    
    