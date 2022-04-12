// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wall_it/components/side_drawer.dart';
import 'package:wall_it/data/data.dart';
import 'package:wall_it/models/wallpaper_model.dart';
import 'package:wall_it/widgets/wallpapers.dart';

import 'components/bottom_navbar.dart';
import 'components/home_banner.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WallpaperModel> walls = <WallpaperModel>[];

  getTrendingWalls() async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
        headers: {"Authorization": apiKEY});

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      walls.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getTrendingWalls();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideBar(),
        body: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              HomeBanner(),
              SizedBox(height: 10),
              WallpaperList(walls: walls, context: context),
              SizedBox(height: 10),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
