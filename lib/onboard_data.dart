import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class OnBoardData {
  String title;
  String subtitle;
  Color backgroundcolor;
  Color titlecolor;
  Color subtitlecolor;
  Widget animation;

  OnBoardData({
    required this.title,
    required this.subtitle,
    required this.backgroundcolor,
    required this.titlecolor,
    required this.subtitlecolor,
    required this.animation,
  });
}

class OnBoardCard extends StatelessWidget {
  const OnBoardCard({Key? key, required this.data}) : super(key: key);

  final OnBoardData data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          data.animation,
          Text(
            data.title,
            style: TextStyle(
                color: data.titlecolor,
                fontSize: 45,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
            child: Text(
              data.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: data.subtitlecolor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
