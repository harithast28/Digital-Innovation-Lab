import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  static String tag = 'home-page';
  static TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    final profilepic = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 100.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/profile.PNG'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Andrea',
        style: style.copyWith(fontSize: 28.0, color: Colors.black),
      ),
    );

    final greenBox = Directionality(
      textDirection: TextDirection.ltr,
      child: new DefaultTextStyle(
        style: style.copyWith(fontSize: 18.0, color: Colors.black),
        child: new Column(
          children: <Widget>[
            new Row(children: <Widget>[
              new Container(
                height: 75,
                width: MediaQuery.of(context).size.width - 56,
                padding: const EdgeInsets.all(8.0),
                child: new Column(
                  children: <Widget>[
                    new Align(
                        alignment: Alignment.topLeft,
                        child: new Text('Your order is ready!')),
                    new Align(
                        alignment: Alignment.centerLeft,
                        child: new Text('Please, collect it from Counter 2.')),
                  ],
                ),
                decoration: new BoxDecoration(
                    color: Color(0xff96bb99),
                    borderRadius: new BorderRadius.all(Radius.circular(8.0))),
              ),
            ]),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
    final button1 = new Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xffb87faa),
        child: new Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.send),
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
              onPressed: () {},
            ),
            Text("CHECK PLACES",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ));
    final button2 = new Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xffb87faa),
        child: new Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.credit_card),
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
              onPressed: () {},
            ),
            Text("VIRTUAL WALLET",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ));

    final button3 = new Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xffb87faa),
        child: new Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.help),
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
              onPressed: () {},
            ),
            Text("SUPPORT",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ));
    final button4 = new Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xffb87faa),
        child: new Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.fastfood),
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
              onPressed: () {},
            ),
            Text("RESTAURANTS",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ));
    final button5 = new Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xffb87faa),
        child: new Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.place),
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
              onPressed: () {},
            ),
            Text("CHECK CROWD",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ));
    final button6 = new Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xffb87faa),
        child: new Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.feedback),
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
              onPressed: () {},
            ),
            Text("FEEDBACK",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ));
    final buttons = new Container(
        width: MediaQuery.of(context).size.width,
        child: new Column(children: <Widget>[
          new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /* <Widget>[
                  new ButtonBar(
                    children: <Widget>[button1, button2, button3],
                  )
                ],*/
                Expanded(child: button1),
                SizedBox(width: 20),
                Expanded(child: button2),
                SizedBox(width: 20),
                Expanded(child: button3),
              ]),
          SizedBox(height: 20),
          new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /* <Widget>[
                  new ButtonBar(
                    children: <Widget>[button1, button2, button3],
                  )
                ],*/
                Expanded(child: button4),
                SizedBox(width: 20),
                Expanded(child: button5),
                SizedBox(width: 20),
                Expanded(child: button6),
              ]),
        ]));

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      child: Column(
        children: <Widget>[profilepic, welcome, greenBox, buttons],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('MINICROWD'),
        backgroundColor: Color(0xffb87faa),
      ),
      body: body,
    );
  }
}
