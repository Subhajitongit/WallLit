// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple[100]),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Lottie.asset("assets/animation/login_animation.json"),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0, top: 24),
              child: Text(
                "Lit up you wall",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black54,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                "with WallLit🔥",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 39,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Center(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepPurple.shade300),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(25.0),
                        child: SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/images/google (1).png",
                                height: 25,
                              ),
                              Text(
                                " Sign in with google",
                              ),
                            ],
                          ),
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
