import 'package:flutter/material.dart';
import 'package:prueba_goodm/models/temperature.dart';


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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Icon(Icons.trending_down,color: Colors.black,size: 50,),
              SizedBox(width: 18,),
              Column(
                children: [
                  Text("Temp. min",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  Text(widget.temp != null ? (((widget.temp.tempMin)-32)*5/9).toStringAsFixed(2)+" Cº" : "-",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w300)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.trending_up,color: Colors.black,size: 50,),
              SizedBox(width: 18,),
              Column(
                children: [
                  Text("Temp. max",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  Text(widget.temp != null ? (((widget.temp.tempMax)-32)*5/9).toStringAsFixed(2)+" Cº" : "-", style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w300))
                  
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
