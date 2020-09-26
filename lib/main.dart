import 'package:flutter/material.dart';
import 'package:login_http/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Screen",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Poppins",
          primaryColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0,
            foregroundColor: Colors.white,
          ),
          accentColor: Colors.redAccent,
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 22, color: Colors.redAccent),
              headline2: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.redAccent),
              bodyText1: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueAccent))),
      home: LoginPage(),
    );
  }
}
