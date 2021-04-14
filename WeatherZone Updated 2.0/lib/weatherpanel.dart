import 'package:flutter/material.dart';

class WeatherPanel extends StatelessWidget {
  final Map weatherData;
  final List tempData;

  const WeatherPanel({Key key, this.weatherData, this.tempData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: StatusPanel(
        iconId: weatherData['weather'][0]['icon'],
        temp: (weatherData['main']['temp'] - 272).round().toString(),
        description: weatherData['weather'][0]['description'],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final String iconId;
  final String temp;
  final String description;

  const StatusPanel({Key key, this.iconId, this.temp, this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 1.2, 30, 8),
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.indigoAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.black,
            child: Image.asset(
              'assets/' +
                  description.replaceAll(' ', '').toLowerCase() +
                  '.png',
              height: 100,
              width: 100,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                temp + '°C',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              Text(description,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }
}
