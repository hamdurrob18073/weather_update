import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'details.dart';
import 'logic.dart';

class WeatherScreen extends StatefulWidget {
 

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  



  
  @override
  Widget build(BuildContext context) {
    final datas = Provider.of<logic>(context);
    var city = datas.city;
    var temperature = datas.temperature;
    var description = datas.description;
    var humidity = datas.humidity;
    var windSpeed = datas.windSpeed;

   

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color:Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: 
         Stack(
          fit: StackFit.expand,
           children: [
            Image.asset('ima/123.jpg',fit: BoxFit.cover,),

             Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  SizedBox(height: 10),
                  
                  
                     Builder(
                       builder: (context) {
                         return Focus(
                           focusNode: datas.focusNode,
                           child: TextField(
                           
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.8),
                              hintText: 'Enter City Name',
                              hintStyle: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 18,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Icon(
                                Icons.location_city,
                                color: Colors.black,
                              ),
                            ),
                            onSubmitted: (value) {
                            datas.focusNode.unfocus();
                            
                            datas.fetchWeatherData(value);
                              
                            },
                                         ),
                         );
                       }
                     ),
                                  
                  
                  SizedBox(height: 50),
                  if (datas.errorMessage.isNotEmpty)
                    Text(
                      datas.errorMessage,
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  if (datas.city.isNotEmpty &&
                      datas.temperature.isNotEmpty &&
                      datas.description.isNotEmpty && datas.humidity.isNotEmpty &&
                  datas.windSpeed.isNotEmpty)
                    GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider.value(value: datas,
                        child: CityWeatherScreen(
                          city:datas.city,temperature:datas.temperature,description:datas.description,humidity:datas.humidity,windSpeed:datas.windSpeed,
                        ),
                      )));},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'City: $city',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Temperature: $temperature°C',
                            style: TextStyle(fontSize: 22, color: Colors.white,),
                            
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Description: $description',
                            style: TextStyle(fontSize: 22, color: Colors.white,),
                          ),
                          SizedBox(height: 10),
                          Text(
                        'Humidity: $humidity%',
                        style: TextStyle(fontSize: 22, color: Colors.white,),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Wind Speed: $windSpeed m/s',
                        style: TextStyle(fontSize: 22, color: Colors.white,),
                      ),
                     
                     
                       
                          
                        ],
                      ),
                    ),
                ],
              ),
        ),
           ],
         ),
      );
    
  }
}
