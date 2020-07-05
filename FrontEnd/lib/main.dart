import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

/*class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Minicrowd'),
          backgroundColor: Color(0xFFB87FAA),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/Logo.jpeg',
                  height: 200,
                  width: 200,
                ),
                Text(
                  'Email',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your email id'),
                ),
                TextFormField(
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                  return null;
                  },
                ),

                Text(
                  'Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Enter your passwor'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                  color: Color(0xFF5B94A6),
                  splashColor: Color(0xFF96BB99),
                ),
                Text(
                  'Not Registered?',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Sign Up',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          padding: EdgeInsets.all(10.0),
        ));
  }
}*/
class _MyAppState extends State<MyApp> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final emailField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          labelText: "Email",
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter your Email ID",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          labelText: "Password",
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter your Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    'assets/images/Logo.jpeg',
                    height: 200,
                    width: 200,
                  ),
                ),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Not Registered? ',
                    style: TextStyle(fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'SignUp',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                      // can add more TextSpans here...
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
