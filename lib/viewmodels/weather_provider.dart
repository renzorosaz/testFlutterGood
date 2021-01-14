
import 'package:flutter/widgets.dart';
import 'package:prueba_goodm/api/owm_api.dart';
import 'package:prueba_goodm/models/forecast.dart';
import 'package:prueba_goodm/models/location.dart';
import 'package:prueba_goodm/models/temperature.dart';

class WeatherProvider extends ChangeNotifier{
  
  Forecast forecast;
  String city;

  Location location = new Location(latitude: 0, longitude: 0);
  
  MainClass temp;
  List tempDia;
  List climDia;

  Future fetchForecast(String value) async {
      city = value;
      OpenWeatherMapAPI api = OpenWeatherMapAPI();

    //primero encuentro la localización    
    location = await api.getLocation(value);     

    print(location.toString());
    // luego busco los pronosticos
    forecast = await api.getForecast(location);

   //buscar la temperatura
    temp= await api.getTemperature(value);

    print(forecast); 
  }

}