// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, sort_child_properties_last, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CheckboxListTile(
                    title: const Text('Accelerator'),
                    value: mounted,
                    onChanged: (True) => print('Checkbox changed'),
                  ),
                  CheckboxListTile(
                    title: const Text('Hygometer'),
                    value: mounted,
                    onChanged: (True) => print('Checkbox changed'),
                  ),
                  CheckboxListTile(
                    title: const Text('GPS 1'),
                    value: mounted,
                    onChanged: (True) => print('Checkbox changed'),
                  ),
                  CheckboxListTile(
                    title: const Text('GPS 2'),
                    value: mounted,
                    onChanged: (True) => print('Checkbox changed'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => print('Call Map Screen (Jalal)'),
                    child: Container(
                      child: const Text('Button 1'),
                      width: 60,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          color: Colors.blue),
                    ),
                  ),
                  InkWell(
                    onTap: () => print('Call Sensors Screen (Shyiar)'),
                    child: Container(
                      child: const Text('Button 2'),
                      width: 60,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          color: Colors.blue),
                    ),
                  ),
                  InkWell(
                    onTap: () => print('Button 3 gedrückt'),
                    child: Container(
                      child: const Text('Button 3'),
                      width: 60,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          color: Colors.blue),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
