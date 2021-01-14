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

  Future<MainClass> getTemperature(String city) async {
    // print(city);
    var response = await http.get("${url}weather?q=${city}&appid=${apiKey}");

    if (response.statusCode != 200) {
      throw Exception(response.body.toString());
    }
    var jsonResponse = convert.jsonDecode(response.body);
    MainClass mainTemp = MainClass.fromJson(jsonDecode(response.body)["main"]);
    print(mainTemp);
    return mainTemp;
  }

  Future<List> getTemDays(Location location) async {
    // print(location);
    var response = await http.get(
        "${url}onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly,minutely&appid=${apiKey}");

    var jsonResponse;

    if (response.statusCode == 200) {
      var jsonReponse = convert.jsonDecode(response.body)["daily"];

      List dias = jsonReponse.map((e) => e).toList();

      print("resu min" + dias[0]["temp"]["min"].toString());
      print("resu max" + dias[0]["temp"]["max"].toString());

      return dias;
    } else {
      print(response.statusCode);
    }
  }

  Future<List> getWeatherDay(Location location) async {
   // print(location);
    var response = await http.get(
        "${url}onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly,minutely&appid=${apiKey}");

    if (response.statusCode == 200) {

        var jsonReponse = convert.jsonDecode(response.body)["daily"];

        print(jsonReponse);

        List climDia = jsonReponse.map((e) => e['weather'][0]).toList();

        print(climDia);

        
        // print("list1"+climDia[0]["main"].toString().toLowerCase());
        // print("list2"+climDia[1]["main"].toString().toLowerCase());
        // print("list3"+climDia[2]["main"].toString().toLowerCase());
        // print("list4"+climDia[3]["main"].toString().toLowerCase());


        return climDia;

    }
  }

  
}
