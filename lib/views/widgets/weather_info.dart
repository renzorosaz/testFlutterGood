import 'package:flutter/material.dart';
import 'package:prueba_goodm/models/forecast.dart';
import 'package:prueba_goodm/models/weather.dart';

class WeatherInfo extends StatelessWidget {
  
  const WeatherInfo({
    Key key,
    @required this.forecast,
  }) : super(key: key);

  final Forecast forecast;

  String formatTemp(double temp) {
    temp -= 273.15;
    return temp.round().toString();
  }

  @override
  Widget build(BuildContext context) {
    
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text("Weather",style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
            Text(
              forecast !=null ?"${formatTemp(forecast.current.temp)}°": "-",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            Text(
             forecast !=null ? "Thermal sensation ${formatTemp(forecast.current.feelLikeTemp)}°" :"-",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        buildWeatherImage(forecast !=null ? forecast.current.condition : WeatherCondition.clear)
      ],
    );
  }

  Image buildWeatherImage(WeatherCondition condition) {
    String imageString = "assets/images/021-cloud.png";

    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        imageString = "assets/images/021-sun.png";
        break;
      case WeatherCondition.fog:
      case WeatherCondition.atmosphere:
      case WeatherCondition.rain:
      case WeatherCondition.drizzle:
      case WeatherCondition.mist:
      case WeatherCondition.heavyCloud:
        imageString = "assets/images/021-cloudy.png";
        break;
      case WeatherCondition.snow:
        imageString = "assets/images/021-snowing-1.png";
        break;
      case WeatherCondition.thunderstorm:
        imageString = "assets/images/021-rain-1.png";
        break;
      default:
        imageString = "assets/images/021-cloudy.png";
    }
    return Image.asset(
      imageString,
      height: 100,
      width: 100,
    );
  }
}
