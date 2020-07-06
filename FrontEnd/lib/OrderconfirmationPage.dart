import 'package:flutter/material.dart';
//import 'package:login/LandingPage.dart';
import 'package:login/app_theme.dart';

class OrderconfirmationPage extends StatefulWidget {
  @override
  _OrderconfirmationPageState createState() => _OrderconfirmationPageState();
}

class _OrderconfirmationPageState extends State<OrderconfirmationPage> {
  final iconPalette = new Container(
      height: 100,
      child: Row(
        children: <Widget>[
          Expanded(
            // otherwise the logo will be tiny
            child: Image.asset("assets/images/icon.jpg"),
          ),
          Expanded(
            // otherwise the logo will be tiny
            child: Image.asset("assets/images/calendar.png"),
          ),
          Expanded(
            // otherwise the logo will be tiny
            child: Image.asset("assets/images/timer.png"),
          ),
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Confirmation"),
        backgroundColor: AppTheme.min_pink,
      ),
      body: Container(
        height: 600,
        child: Column(
          children: <Widget>[
            Text(""),
            Text(""),
            Text("Your Order is confirmed",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 40)),
            Text(""),
            Text(""),
            Text("Order Number : #445576",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
            Text(""),
            Text(""),
            Text("Pizzeria.it",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
            Text("Via Giovanni Antonio Amadeo, 67",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 15)),
            Text("Milano, Italy, Pin-20134",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 15)),
            Text("contact:+39 3785785, www.pizzeria.it",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 15)),
            Image.asset(
              "assets/images/done.png",
              height: 200,
              width: 200,
            ),
            iconPalette,
          ],
        ),
      ),
    );
  }
}
