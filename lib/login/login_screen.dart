// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:wall_it/home_screen.dart';
import 'package:wall_it/onboard_screens/onboarding_screen.dart';

import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.googleAccount.value == null) {
            return buildLoginQuery();
          } else {
            return OnBoardScreen();
          }
        }),
      ),
    );
  }

  // Center buildProfile() {
  //   return Center(
  //     child: CircleAvatar(
  //       backgroundImage:
  //           Image.network(controller.googleAccount.value?.photoUrl ?? '').image,
  //       radius: 100,
  //     ),
  //   );
  // }

  SingleChildScrollView buildLoginQuery() {
    return SingleChildScrollView(
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
                onPressed: () {
                  controller.login();
                },
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
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
