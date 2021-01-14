import 'package:flutter/material.dart';
import 'package:prueba_goodm/models/temperature.dart';
import 'package:google_fonts/google_fonts.dart';

class TempeView extends StatefulWidget {
  const TempeView({
    Key key,
    @required this.temp,
  }) : super(key: key);

  final MainClass temp;

  @override
  _TempeViewState createState() => _TempeViewState();
}

class _TempeViewState extends State<TempeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 20,left:20),
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Icon(
                  Icons.trending_down_rounded,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  children: [
                    Text(
                      "Temp. min",
                      style: GoogleFonts.baloo(
                          fontSize: 25,color: Colors.white),
                    ),
                    Text(
                      widget.temp != null
                          ? (((widget.temp.tempMin) - 32) * 5 / 9)
                                  .toStringAsFixed(2) +
                              " Cº"
                          : "-",
                      style: GoogleFonts.baloo(
                          fontSize: 15, fontWeight: FontWeight.w300,color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.trending_up_rounded,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  children: [
                    Text("Temp. max",
                        style: GoogleFonts.baloo(
                            fontSize: 25,color: Colors.white)),
                    Text(
                      widget.temp != null
                          ? (((widget.temp.tempMax) - 32) * 5 / 9)
                                  .toStringAsFixed(2) +
                              " Cº"
                          : "-",
                      style: GoogleFonts.baloo(
                          fontSize: 15, fontWeight: FontWeight.w300,color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
