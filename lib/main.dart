import 'package:br_web_app/pages/calendar_reactive.dart';
import 'package:flutter/material.dart';
import 'package:br_web_app/pages/Login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    calendar_reactive.tag: (context) => calendar_reactive(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BR_reservation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
