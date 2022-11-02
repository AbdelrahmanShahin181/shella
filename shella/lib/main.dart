import 'package:flutter/material.dart';

import 'package:shella/screens/NavigationScreen.dart';

void main() {
  runApp(MyApp());
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
