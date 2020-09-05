import 'package:flutter/material.dart';
import 'package:go_farm/splashScreen.dart';
import 'package:go_farm/ui/Auth/login/login.dart';
import 'package:go_farm/ui/constant/constant.dart';
import 'package:go_farm/ui/getStarted.dart';
import 'package:go_farm/ui/screens/menu.dart';
// import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor
      ),
      initialRoute: '/started',
      routes: {
        '/started' : (context) => GetStarted(),
        '/login' : (context) => Login(),
        '/menu' : (context) => Menu(),
      },
      debugShowCheckedModeBanner: false,
      title: "Go-Farm",
      // home: Menu(),
    );
  }
}