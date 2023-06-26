import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logic.dart';
class CityWeatherScreen extends StatefulWidget {
  final String city;
  final String temperature;
  final String description;
  final String humidity;
  final String windSpeed;
 


  CityWeatherScreen({
    required this.city,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    
    
  });

  @override
  State<CityWeatherScreen> createState() => _CityWeatherScreenState();
}

class _CityWeatherScreenState extends State<CityWeatherScreen> {
   
    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final logicInstance = Provider.of<logic>(context);
    logicInstance.fetchTomorrowWeatherData(widget.city);
  }
  @override
  Widget build(BuildContext context) {
    final datas = Provider.of<logic>(context);
     
    var temperature = datas.ttemperature;
    var description = datas.tdescription;
    var humidity = datas.thumidity;
    var windSpeed = datas.twindSpeed;
    
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,centerTitle: true,
        title: Text('City Weather',  style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color:Colors.white,
          ),),
      ),
      body: Stack(fit: StackFit.expand,
        children:[ 
           Image.asset('ima/123.jpg',fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
            
              
              children: [
                 SizedBox(height: 6),
                 Text("Todays Weather:", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                  SizedBox(height: 20),
                Text(
                  'City: ${widget.city}',
                  style: TextStyle(fontSize: 25,color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Temperature: ${widget.temperature}°C',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Description: ${widget.description}',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Humidity: ${widget.humidity}%',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Wind Speed: ${widget.windSpeed} m/s',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ), 
                 SizedBox(height: 10),
               
                 SizedBox(height: 30),
                      if (datas.errorMessage.isNotEmpty)
                        Text(
                          datas.errorMessage,
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                      if (
                          datas.ttemperature.isNotEmpty &&
                          datas.tdescription.isNotEmpty && datas.thumidity.isNotEmpty &&
                      datas.twindSpeed.isNotEmpty)
                        Column(
                          
                          children: [
                
                             Text("Tomorrow Weather:", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                            SizedBox(height: 20),
                            Text(
                              'Temperature: $temperature°C',
                              style: TextStyle(fontSize: 20, color: Colors.white,),
                              
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Description: $description',
                              style: TextStyle(fontSize: 20, color: Colors.white,),
                            ),
                            SizedBox(height: 8),
                            Text(
                          'Humidity: $humidity%',
                          style: TextStyle(fontSize: 20, color: Colors.white,),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Wind Speed: $windSpeed m/s',
                          style: TextStyle(fontSize: 20, color: Colors.white,),
                        ),
                         
                            
                          ],
                        ),
              ],
            ),
          ),]
      ),
    );
  }
}
