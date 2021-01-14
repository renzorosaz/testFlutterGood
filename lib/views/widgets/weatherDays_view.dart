import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherDaysView extends StatelessWidget {
  const WeatherDaysView({
    Key key,
    @required this.climDia,
    @required this.tempDia,
  }) : super(key: key);

  final List tempDia;
  final List climDia;

  @override
  Widget build(BuildContext context) {
    // print(climDia[0]["main"].toString().toLowerCase());
    // print(climDia[1]["main"].toString().toLowerCase());
    // print(climDia[2]["main"].toString().toLowerCase());
    // print(climDia[3]["main"].toString().toLowerCase());
    // print(climDia[4]["main"].toString().toLowerCase());
    // print(climDia[5]["main"].toString().toLowerCase());
    // print(climDia[6]["main"].toString().toLowerCase());

    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 175),
            child: Text(
              "Week Weather",
              style: GoogleFonts.baloo(fontSize: 25),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 400,
            child: ListView.builder(
                itemCount: tempDia.length,
                itemBuilder: (c, i) {
                  return Container(
                    height: 120,
                    width: 240,
                    child: Card(
                      color: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text("Temp Min",
                                        style: GoogleFonts.baloo(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        tempDia != null
                                            ? tempDia[i]["temp"]["min"]
                                                .toString()
                                            : "No",
                                        style: GoogleFonts.baloo(
                                            fontSize: 15,color: Colors.blueAccent,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                buildWeatherImage(climDia[i]["main"]
                                    .toString()
                                    .toLowerCase()),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Temp Max",
                                        style: GoogleFonts.baloo(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        tempDia != null
                                            ? tempDia[i]["temp"]["max"]
                                                .toString()
                                            : "NO",
                                      style: GoogleFonts.baloo(
                                            fontSize: 15,color: Colors.redAccent,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

Image buildWeatherImage(String condition) {
  String imageString = "assets/images/021-cloud.png";

  switch (condition) {
    case "clear":
    case "lightCloud":
      imageString = "assets/images/021-sun.png";
      break;
    case "fog":
    case "atmosphere":
    case "rain":
    case "drizzle":
    case "mist":
    case "heavyCloud":
      imageString = "assets/images/021-cloudy.png";
      break;
    case "heavyCloud":
      imageString = "assets/images/021-snowing-1.png";
      break;
    case "thunderstorm":
      imageString = "assets/images/021-rain-1.png";
      break;
  }

  return Image.asset(
    imageString,
    height: 50,
    width: 50,
  );
}
