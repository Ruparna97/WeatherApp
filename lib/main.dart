import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      child: Center(
        child: Text('Weather With Your Name',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white.withOpacity(0.9),
              fontSize: 25,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 2.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            )),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: new AssetImage("images/weather1.jpg"),
        fit: BoxFit.fill,
      )),
    ));
  }
}
