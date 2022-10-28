// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroscopeSensorScreen extends StatefulWidget {
  const GyroscopeSensorScreen({Key? key}) : super(key: key);

  @override
  _GyroscopeSensorScreenState createState() => _GyroscopeSensorScreenState();
}

class _GyroscopeSensorScreenState extends State<GyroscopeSensorScreen> {
  double x = 0, y = 0, z = 0;
  String direction = "none";

  @override
  void initState() {
    gyroscopeEvents.listen((GyroscopeEvent event) {
      print(event);

      x = event.x;
      y = event.y;
      z = event.z;

      if (x > 0) {
        direction = "back";
      } else if (x < 0) {
        direction = "forward";
      } else if (y > 0) {
        direction = "left";
      } else if (y < 0) {
        direction = "right";
      }

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gyroscope Sensor in Flutter"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          child: Column(children: [
            Text(
              direction,
              style: TextStyle(fontSize: 30),
            )
          ])),
    );
  }
}
