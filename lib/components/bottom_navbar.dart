import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wall_it/Liked.dart';
import 'package:wall_it/profile.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.red,
          ]),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LikedScreen()));
              },
              icon: const Icon(CupertinoIcons.heart_fill),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
              icon: const Icon(CupertinoIcons.profile_circled),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
