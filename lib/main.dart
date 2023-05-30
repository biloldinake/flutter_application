import 'package:flutter/material.dart';
import 'package:flutter_application/home_view.dart';



void main ( ){
  runApp(WeathreApp());
}
class WeathreApp extends StatelessWidget {
  const WeathreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}