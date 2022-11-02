import 'package:flutter/material.dart';
//import 'package:geolocation/geolocation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart' as geo;
//import 'package:geolocator/geolocator.dart';
//import 'package:geolocation/geolocation.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  //geo.Position? _currentPosition;
  String myAdress = 'My adress';
  var _currentPosition;

  Future<geo.Position> _determinePosition() async {
    bool serviceEnabled;
    geo.LocationPermission permission;

    serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await geo.Geolocator.checkPermission();

    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == geo.LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    geo.Position position = await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        _currentPosition = position;
        myAdress = "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
    return _currentPosition;
  }

  Future<geo.Position> geLatAndLong() async {
    return await geo.Geolocator.getCurrentPosition().then((value) => value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: ListView(
        children: [
          Container(
            height: 400,
            child: GoogleMap(
              //GoogleMap
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(51.481846, 7.216236),
                zoom: 11.0,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Text(myAdress),
                TextButton(
                    onPressed: () async {
                      _currentPosition = await _determinePosition();
                      // _currentPosition = await geLatAndLong();
                      print(_currentPosition.latitude);
                      print(_currentPosition.longitude);
                    },
                    child: Text('Locate Me')),
                //Text('Latitude: ' + _currentPosition?.latitude.toString()),

                _currentPosition != null
                    ? Text('latitude =' + _currentPosition.latitude.toString())
                    : Container(),
                _currentPosition != null
                    ? Text(
                        'longitude =' + _currentPosition.longitude.toString())
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
