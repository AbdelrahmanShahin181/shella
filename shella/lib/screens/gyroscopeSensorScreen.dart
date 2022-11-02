// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MovementSensorsScreen extends StatefulWidget {
  const MovementSensorsScreen({Key? key}) : super(key: key);

  @override
  _MovementSensorsScreenState createState() => _MovementSensorsScreenState();
}

class _MovementSensorsScreenState extends State<MovementSensorsScreen> {
  double x = 0, y = 0, z = 0;
  String rotationXAxis = "none";
  String rotationYAxis = "none";
  String rotationZAxis = "none";

  String directionX = "none";
  String directionY = "none";
  String directionZ = "none";

  @override
  void initState() {
    gyroscopeEvents.listen((GyroscopeEvent event) {
      //print(event);

      x = event.x;
      y = event.y;
      z = event.z;

      if (x > 0) {
        rotationXAxis = "up and forward";
      } else if (x < 0) {
        rotationXAxis = "down and backward";
      }
      if (y > 0) {
        rotationYAxis = "turn left";
      } else if (y < 0) {
        rotationYAxis = "turn right";
      }
      if (z < 0) {
        rotationZAxis = "rotation z axis minus";
      } else if (z > 0) {
        rotationZAxis = "rotation z axis plus";
      }

      setState(() {});
    });

    userAccelerometerEvents.listen((event) {
      x = event.x; // right minus left plus
      y = event.y; // back plus front minus
      z = event.z; // down plus up minus

      if (x > 0) {
        directionX = "going left";
      } else if (x < 0) {
        directionX = "going right";
      }
      if (y > 0) {
        directionY = "going backward";
      } else if (y < 0) {
        directionY = "going forward";
      }
      if (z < 0) {
        directionZ = "going up";
      } else if (z > 0) {
        directionZ = "going down";
      }

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gyroscope/Accelerometer Sensor in Flutter"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(padding: EdgeInsets.all(30), children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "rotationXAxis: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            rotationXAxis,
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "rotationYAxis: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            rotationYAxis,
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "rotationZAxis: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            rotationZAxis,
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "\ndirectionX: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            directionX,
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "directionY: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            directionY,
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "directionZ: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            directionZ,
            style: TextStyle(fontSize: 15),
          )
        ]),
      ]),
    );
  }
}

class LiveData {
  LiveData(this.x, this.y, this.z);
  final double x;
  final double y;
  final double z;
}
