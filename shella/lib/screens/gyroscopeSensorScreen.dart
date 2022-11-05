// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, avoid_print, file_names

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MovementSensorsScreen extends StatefulWidget {
  const MovementSensorsScreen({Key? key}) : super(key: key);

  @override
  _MovementSensorsScreenState createState() => _MovementSensorsScreenState();
}

class _MovementSensorsScreenState extends State<MovementSensorsScreen> {
  final database = FirebaseDatabase.instance.ref();

  double rotationXAxis = 0, rotationYAxis = 0, rotationZAxis = 0;
  double directionX = 0, directionY = 0, directionZ = 0;

  @override
  void initState() {
    gyroscopeEvents.listen((GyroscopeEvent event) {
      rotationXAxis = event.x;
      rotationYAxis = event.y;
      rotationZAxis = event.z;

      setState(() {});
    });

    userAccelerometerEvents.listen((event) {
      directionX = event.x; // right minus left plus
      directionY = event.y; // back plus front minus
      directionZ = event.z; // down plus up minus

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sensorsRef = database.child('sensors/');

    return Scaffold(
      appBar: AppBar(
        title: Text("Gyroscope/Accelerometer Sensor in Flutter"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(padding: EdgeInsets.all(30), children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "rotationXAxis: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            rotationXAxis.toString(),
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "rotationYAxis: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            rotationYAxis.toString(),
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "rotationZAxis: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            rotationZAxis.toString(),
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "\ndirectionX: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            directionX.toString(),
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "directionY: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            directionY.toString(),
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "directionZ: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            directionZ.toString(),
            style: TextStyle(fontSize: 15),
          ),
          InkWell(
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                color: Colors.blue,
              ),
              child: const Text(
                'Save to db',
              ),
            ),
            onTap: () async {
              try {
                await sensorsRef.set({
                  "timestamp": DateTime.now().millisecondsSinceEpoch,
                  "rotationX": rotationXAxis,
                  "rotationY": rotationYAxis,
                  "rotationZ": rotationZAxis,
                  "directionX": directionX,
                  "directionY": directionY,
                  "directionZ": directionZ,
                });
              } catch (error) {
                print('there has been an error $error');
              }
            },
          )
        ]),
      ]),
    );
  }

  Future createData() async {}
}

class LiveData {
  LiveData(this.x, this.y, this.z);
  final double x;
  final double y;
  final double z;
}
