import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:prueba_goodm/models/forecast.dart';
import 'package:prueba_goodm/models/location.dart';
import 'package:prueba_goodm/models/temperature.dart';

class OpenWeatherMapAPI {
  String url = "https://api.openweathermap.org/data/2.5/";
  String apiKey = "2de4c167e734b9df21b86b7f9a467e56";

  //primero haya la locación para luego hayar el clima
  Future<Location> getLocation(String city) async {
    // print(city);

    var response = await http.get("${url}weather?q=${city}&appid=${apiKey}");

    if (response.statusCode != 200) {
      throw Exception(response.body.toString());
    }

    print(Location.fromJson(jsonDecode(response.body)));
    return Location.fromJson(jsonDecode(response.body));
  }

  Future<Forecast> getForecast(Location location) async {
    // print(location);

    var response = await http.get(
        "${url}onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly,minutely&appid=${apiKey}");

    if (response.statusCode != 200) {
      throw Exception(response.body.toString());
    }

    return Forecast.fromJson(jsonDecode(response.body));
  }

}
