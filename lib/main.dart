import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

String searchApi = "https://www.metaweather.com/api/location/search/?query=";
String searchApiLoaction = "https://www.metaweather.com/api/location/";

class _MyAppState extends State<MyApp> {
  String Location = "Kolkata";
  int temperature = null;
  int woeid = 2295386;
  String errormsg = '';

  initState() {
    super.initState();
    SearchParam();
  }

  void SearchId(String input) async {
    var result = await http.get(searchApi + input);
    var result1 = json.decode(result.body)[0];

    setState(() {
      Location = result1["title"];
      woeid = result1["woeid"];
    });
  }

  void SearchParam() async {
    try {
      var result = await http.get(searchApiLoaction + woeid.toString());
      var result1 = jsonDecode(result.body);
      var consolidateWeather = result1["consolidated_weather"];
      var data = consolidateWeather[0];

      setState(() {
        temperature = data["the_temp"].round();
        errormsg = '';
      });
    } catch (error) {
      errormsg = 'Couldnt Find City';
    }
  }

  void onSubmit(input) async {
    await SearchId(input);
    await SearchParam();
  }

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
                body: temperature == null
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AppBar(
                            title: Text(
                              "Weathering With Your Name",
                              style: TextStyle(fontSize: 25),
                            ),
                            backgroundColor: Colors.transparent,
                          ),
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                  onSubmitted: (String input) {
                                    onSubmit(input);
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Search another location...',
                                    hintStyle: TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                    prefixIcon:
                                        Icon(Icons.search, color: Colors.white),
                                  )),
                              Text(
                                errormsg,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                            ],
                          )
                        ],
                      ))));
  }
}
