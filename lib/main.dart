import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int temperature = 0;
  String Location = "Kolkata";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: new AssetImage("images/weather1.jpg"),
              fit: BoxFit.cover,
            )),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      Location,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    Center(
                        child: Text(
                      temperature.toString() + " °C",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
                    Column(
                      children: [
                        TextField(
                            style: TextStyle(color: Colors.white, fontSize: 25),
                            decoration: InputDecoration(
                              hintText: 'Search another location...',
                              hintStyle: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.white),
                            )),
                      ],
                    )
                  ],
                ))));
  }
}
