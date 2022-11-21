import 'package:flutter/material.dart';
import 'package:br_web_app/pages/colors/my_colors.dart';
import 'package:br_web_app/pages/Login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comedor Utt',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => const LoginPage(),
      },
      theme: ThemeData(
          // fontFamily: 'Roboto',
          primaryColor: MyColors.primaryColor,
          colorScheme: const ColorScheme.light(primary: MyColors.primaryColor)),
    );
  }
}
