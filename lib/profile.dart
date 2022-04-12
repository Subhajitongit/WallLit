// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login/login_controller.dart';
import 'login/login_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = Get.put(LoginController());

  String name = "";
  String email = "";
  String image = "";

  getUserData() {
    LocalData.getName().then((value) {
      setState(() {
        name = value!;
      });
    });

    LocalData.getEmail().then((value) {
      setState(() {
        email = value!;
      });
    });

    LocalData.getImage().then((value) {
      setState(() {
        image = value!;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: Image.network(image).image,
              radius: 100,
            ),
          ),
          SizedBox(height: 20),
          Text(
            name,
            // controller.googleAccount.value?.displayName ?? "Hello",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          Text(
            email,
            // controller.googleAccount.value?.email ?? "Hello@walllit.com",
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 250),
          GestureDetector(
            onTap: () {
              controller.logout();
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 2.0,
                ),
                gradient: const LinearGradient(colors: [
                  Color(0x36FFFFFF),
                  Color(0x0FFFFFFF),
                ]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.logout, color: Colors.red),
                  Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
