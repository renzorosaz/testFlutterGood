import 'package:flutter/material.dart';
import 'package:prueba_goodm/models/forecast.dart';
import 'package:prueba_goodm/models/temperature.dart';
import 'package:prueba_goodm/viewmodels/weather_provider.dart';
import 'package:provider/provider.dart';
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
      body: ListView(
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
                        hintText: "Ingrese Ciudad",hintStyle: GoogleFonts.baloo(fontSize: 15)),
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
              forecast != null
                  ? forecast.current.description
                  : "Ingrese la ciudad",
              style: GoogleFonts.baloo(fontSize: 20),
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
              : Container()
        ],
      ),
    );
  }
}
