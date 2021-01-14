import 'package:flutter/material.dart';
import 'package:prueba_goodm/models/forecast.dart';
import 'package:prueba_goodm/models/temperature.dart';
import 'package:prueba_goodm/viewmodels/weather_provider.dart';
import 'package:provider/provider.dart';
import 'package:prueba_goodm/views/widgets/temperature_view.dart';

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
                        suffix: forecast != null
                            ? Container(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator())
                            : null,
                        hintText: "Ingrese Ciudad"),
                    onSubmitted: (value) async {
                      Provider.of<WeatherProvider>(context, listen: false)
                          .fetchForecast(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          TempeView(temp:temp),
          SizedBox(
            height: 24,
          ),
          WeatherInfo(forecast: forecast),
          SizedBox(
            height: 24,
          ),
          Center(
                child: Text(
                  forecast != null
                      ? forecast.current.description
                      : "Ingrese la ciudad",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w300),
                ),
              ),
          
        ],
      ),
    );
  }
}
