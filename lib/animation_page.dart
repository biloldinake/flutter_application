import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Animationpagr extends StatelessWidget {
  const Animationpagr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        width: double.infinity,
       
        child:SizedBox(
  width: 250.0,
  child: TextLiquidFill(
    waveDuration: Duration(seconds: 5),
    text: 'Animation',
    waveColor: Colors.blueAccent,
    boxBackgroundColor: Colors.redAccent,
    textStyle: TextStyle(
      fontSize: 80.0,
      fontWeight: FontWeight.bold,
    ),
    boxHeight: 300.0,
  ),
),
      ),
    );
  }
}