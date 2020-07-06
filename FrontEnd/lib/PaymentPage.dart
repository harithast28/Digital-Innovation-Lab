import 'package:flutter/material.dart';
import 'package:login/OrderconfirmationPage.dart';
import 'app_theme.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final topSection = new Container(
    height: 100,
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Image.asset('assets/images/virtualwallet.png', height: 80, width: 80),
      Text(
        "My Balance",
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 40),
      ),
      Text(
        "\t€100",
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 40),
      ),
    ]),
  );

  final bottomSection = new Container(
    height: 380,
    child: Column(
      children: <Widget>[
        Text(
          "You owe Pizzeria.it €50",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 60),
        ),
        Image.asset(
          "assets/images/pizzeria.jpg",
          height: 150,
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Payment Gateway"),
          backgroundColor: AppTheme.min_pink,
        ),
        body: Container(
          height: 600,
          child: Column(
            children: <Widget>[
              topSection,
              bottomSection,
              RaisedButton(
                color: AppTheme.notWhite,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderconfirmationPage()),
                  );
                },
                child: Text(
                  "Pay Now",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
