// ignore_for_file: avoid_unnecessary_containers

import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wall_it/hh.dart';
import 'package:wall_it/login_screen.dart';
import 'package:wall_it/onboard_data.dart';

class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({Key? key}) : super(key: key);

  final data = [
    OnBoardData(
      title: "The Best!",
      subtitle:
          "Wallit provides you with the best wallpapers that makes your screen lit🔥",
      backgroundcolor: Colors.white,
      titlecolor: Colors.black,
      subtitlecolor: Colors.grey,
      animation: Lottie.asset("assets/animation/ani1.json"),
    ),
    OnBoardData(
      title: "Variety",
      subtitle:
          'Get access to thousands of wallpapers and choose your favorites💯',
      backgroundcolor: Colors.blue,
      titlecolor: Colors.white,
      subtitlecolor: Colors.white,
      animation: Lottie.asset('assets/animation/ani2.json'),
    ),
    OnBoardData(
      title: "Hassle Free!",
      subtitle:
          'Wallit is extremely easy and simple, So keep you walls fresh and beautiful with NO HASSLE✨',
      backgroundcolor: Colors.green,
      titlecolor: Colors.white,
      subtitlecolor: Colors.yellow,
      animation: Lottie.asset("assets/animation/ani3.json"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        itemCount: data.length,
        colors: data.map((e) => e.backgroundcolor).toList(),
        itemBuilder: (int index, double value) {
          return SafeArea(child: OnBoardCard(data: data[index]));
        },
        onFinish: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
      ),
    );
  }
}
