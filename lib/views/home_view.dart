import 'package:flutter/material.dart';
import 'package:prueba_goodm/models/forecast.dart';
import 'package:prueba_goodm/models/temperature.dart';
import 'package:prueba_goodm/models/weather.dart';
import 'package:prueba_goodm/viewmodels/weather_provider.dart';
import 'package:provider/provider.dart';
import 'package:prueba_goodm/views/widgets/gradient_container.dart';
import 'package:prueba_goodm/views/widgets/temperature_view.dart';
import 'package:prueba_goodm/views/widgets/weatherDays_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_goodm/views/widgets/weather_info.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final _text = TextEditingController();

    Forecast forecast = Provider.of<WeatherProvider>(context).forecast;

    MainClass temp = Provider.of<WeatherProvider>(context).temp;
    //recupero temperatura diaria
    List tempDia = Provider.of<WeatherProvider>(context).tempDia;
    //recupero clima diario
    List climDia = Provider.of<WeatherProvider>(context).climDia;

    return Scaffold(
      body: _buildGradientContainer(
        true,
        forecast == null ? WeatherCondition.clear : forecast.current.condition,
        ListView(
          children: [
            Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3))
                    ]),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextField(
                        controller: _text,
                        decoration: InputDecoration(
              //si selecciona el input, cargara un indicador hasta que se termine la accion
              suffix: tempDia != null
                  ? Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator())
                  : null,
              hintText: "Ingrese Ciudad",
              hintStyle: GoogleFonts.baloo(fontSize: 15)),
                        onSubmitted: (value) async {
            Provider.of<WeatherProvider>(context, listen: false)
                .fetchForecast(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),

            TempeView(temp: temp),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(
                color: Colors.black54,
              ),
            ),
            WeatherInfo(forecast: forecast),
            SizedBox(
              height: 12,
            ),
            Center(
              child: Text(
                forecast != null ? forecast.current.description : "-",
                style: GoogleFonts.baloo(fontSize: 20,color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(
                color: Colors.black54,
              ),
            ),

            //
            tempDia != null
                ? WeatherDaysView(tempDia: tempDia, climDia: climDia)
                : Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Text(
                      "Week Weather",
                      style: GoogleFonts.baloo(fontSize: 25),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

GradientContainer _buildGradientContainer(
      bool isDayTime, WeatherCondition condition, Widget child) {
    GradientContainer container;
    if (!isDayTime) {
      container = GradientContainer(color: Colors.blueGrey, child: child);
    } else {
      switch (condition) {
        case WeatherCondition.clear:
        case WeatherCondition.lightCloud:
          container = GradientContainer(color: Colors.yellow, child: child);
          break;
        case WeatherCondition.fog:
        case WeatherCondition.atmosphere:
        case WeatherCondition.rain:
        case WeatherCondition.drizzle:
        case WeatherCondition.mist:
        case WeatherCondition.heavyCloud:
          container = GradientContainer(color: Colors.indigo, child: child);
          break;
        case WeatherCondition.snow:
          container = GradientContainer(color: Colors.lightBlue, child: child);
          break;
        case WeatherCondition.thunderstorm:
          container = GradientContainer(color: Colors.deepPurple, child: child);
          break;
        default:
          container = GradientContainer(color: Colors.lightBlue, child: child);
      }
    }
    return container;
  
}