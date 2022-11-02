import 'package:flutter/material.dart';

import 'package:shella/screens/NavigationScreen.dart';

import 'package:shella/screens/googleMape.dart';

void main() {
  //runApp(MyApp());
  runApp(GoogleApp());
}

class GoogleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shella App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavigationScreen(),
    );
  }
}
