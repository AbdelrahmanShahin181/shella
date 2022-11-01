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
              InkWell(
                child: Container(
                  child: const Text(
                    'Aufnehmen',
                  ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: Colors.blue,
                  ),
                ),
                onTap: () => print('Aufnehmen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
