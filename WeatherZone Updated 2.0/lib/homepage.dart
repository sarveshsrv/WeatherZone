import 'firstPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weatherpanel.dart';
import 'bottompanel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController myController = new TextEditingController();

  Map weatherData;

  fetchWeatherData() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=' +
            myController.text +
            '&appid=817d08ef6f65cd87ee8f0b72b4c487d5'));
    setState(() {
      weatherData = json.decode(response.body);
    });
  }

  List tempData;
  fetchtempData() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=' +
            myController.text +
            '&appid=817d08ef6f65cd87ee8f0b72b4c487d5'));
    setState(() {
      tempData = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: kElevationToShadow[6],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          controller: myController,
                          decoration: InputDecoration(
                            filled: true,
                            //border: InputBorder.none,
                            hintText: 'Enter City',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(11.0),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        fetchWeatherData();
                        fetchtempData();
                        //to hide the keyboard when finsihed typing and clicking on the search button
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              weatherData == null
                  ? Center(child: FirstPage())
                  : WeatherPanel(
                      weatherData: weatherData,
                      tempData: tempData,
                    ),
              SizedBox(
                height: 4,
              ),
              weatherData == null
                  ? Center(child: null)
                  : BottomPanel(
                      weatherData: weatherData,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
