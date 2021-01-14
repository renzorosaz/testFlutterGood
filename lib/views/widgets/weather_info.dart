import 'package:flutter/material.dart';
import 'package:prueba_goodm/models/forecast.dart';
import 'package:prueba_goodm/models/weather.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 250),
          child: Text(
            "Weather",
            style: GoogleFonts.baloo(fontSize: 25,color: Colors.white),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  forecast != null
                      ? "${formatTemp(forecast.current.temp)}°"
                      : "-",
                  style: GoogleFonts.baloo(
                      fontSize: 20, fontWeight: FontWeight.w300,color: Colors.white),
                ),
                Text(
                  forecast != null
                      ? "Thermal sensation ${formatTemp(forecast.current.feelLikeTemp)}°"
                      : "-",
                  style: GoogleFonts.baloo(
                      fontSize: 15, fontWeight: FontWeight.w300,color: Colors.white),
                ),
              ],
            ),
            buildWeatherImage(forecast != null
                ? forecast.current.condition
                : WeatherCondition.clear)
          ],
        ),
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
