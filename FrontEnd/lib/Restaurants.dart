//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login/FoodDetails.dart';
import 'package:login/Home.dart';
import 'package:login/app_theme.dart';

class Restaurants extends StatefulWidget {
  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  static List<String> restaurant = <String>[
    '\tPizzeria.it',
    '\tTia Wines',
    '\tMr.Pizza',
    '\tBurger Point'
  ];
  static List<String> crowd = <String>[
    '25% Occupied\t',
    '30% Occupied\t',
    '45% Occupied\t',
    '70% Occupied\t'
  ];

  final topSection = new Container(
    height: 100,
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Image.asset('assets/images/food.jpg', height: 80, width: 80),
      Text(
        "Food Counters",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 50),
      ),
    ]),
  );

  final middleSection = new Container(
    height: 100,
    child: Home(),
  );

  final bottomSection = new Container(
    height: 400,
    child: ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: restaurant.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(children: <Widget>[
          Container(
              height: 90,
              color: AppTheme.min_green,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoodDetailsPage()));
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(30.0),
                      child: Text('${restaurant[index]}',
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white)),
                      color: AppTheme.min_pink,
                    ),
                  ),
                  Text(
                    '${crowd[index]}',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                    textAlign: TextAlign.right,
                  ),
                ],
              ))
        ]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MiniCrowd"),
          backgroundColor: AppTheme.min_pink,
        ),
        body: Container(
          height: 600,
          child: Column(
            children: <Widget>[topSection, middleSection, bottomSection],
          ),
        ));
  }
}
