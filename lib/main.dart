// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wall_it/home_screen.dart';
import 'package:wall_it/login/login_screen.dart';

import 'login/login_controller.dart';
import 'onboard_screens/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool logCheck = false;

  getLogStatus() {
    LocalData.getLoginInfo().then((value) {
      setState(() {
        logCheck = value!;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getLogStatus();
    print(logCheck);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
        fontFamily: "Poppins",
      ),
      home: logCheck ? HomeScreen() : LoginScreen(),
    );
  }
}
