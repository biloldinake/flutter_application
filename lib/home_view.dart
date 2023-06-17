import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application/search_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

double kelvin = 0;
String cliner = '';
String city = '';
double temp = 0;

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    showWeatherData();
    super.initState();
  }

  Future<dynamic> abayirainAlipKel(Position position) async {
    var client = Client();
    Uri uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=6a6cd3e2d7dcabffe0761fb8419321a8&units=metric' );
    final Vremya = await client.get(uri);
    final jsonAnswer = jsonDecode(Vremya.body);
    city = jsonAnswer['name'].toString();
    temp = jsonAnswer['main']['temp'];

    log('kelvin===>$kelvin');
    log('temp===>${temp.toString()}');
    cliner = jsonAnswer['sys']['country'];
    log('city===>$city');
    log('cliner==>$cliner');
    // log('$city');
    setState(() {});
  }



  Future<void> getTypedCity({String? cityName}) async {
    final client = Client();
    final apiUrkl =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=6a6cd3e2d7dcabffe0761fb8419321a8&units=metric';
    final uri = Uri.parse(apiUrkl);
    final Vremya = await client.get(uri);
    final jsonAnswer = jsonDecode(Vremya.body);
    city = jsonAnswer['name'].toString();
    temp = jsonAnswer['main']['temp'];
    cliner = jsonAnswer['sys']['country'];
    setState(() {});
    log('city===>$city');
    log('cliner==>$cliner');
    // log('$city');
  }

  showWeatherData() async {
    final position = await  getPosition();
    abayirainAlipKel(position);
    log('latitude ====> ${position.latitude}');
    log('longitude ====> ${position.longitude}');
  }

  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.near_me,
            size: 40,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                var result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => searchview()));
                getTypedCity(cityName: result);
              },
              icon: Icon(
                Icons.location_city,
                size: 40,
              ),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/biloldin.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 80,
                left: 50,
                child: Text(
                  '${temp.toStringAsFixed(0)}°C⛅',
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Positioned(
                top: 250,
                left: 110,
                right: 0,
                child: Text(
                  "Jiluu\ kiyinip  \chyk 👕",
                  style: TextStyle(fontSize: 65),
                ),
              ),
              Positioned(
                left: 70,
                top: 30,
                child: Text(
                  "Countri:$cliner",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "$city ",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
