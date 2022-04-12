import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wall_it/widgets/wallpapers.dart';

import 'components/bottom_navbar.dart';
import 'data/data.dart';
import 'models/wallpaper_model.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  final String searchQuery;
  const SearchScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  List<WallpaperModel> walls = <WallpaperModel>[];

  getSearchWalls(String query) async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=" +
            widget.searchQuery +
            "&per_page=80"),
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
    getSearchWalls(widget.searchQuery);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              const TextSpan(
                  text: 'Wall',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  )),
              TextSpan(
                text: 'Lit',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.yellow.shade700),
              ),
              TextSpan(
                text: '🔥',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.yellow.shade700),
              )
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WallpaperList(walls: walls, context: context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Showing results for [" + widget.searchQuery + "]",
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 10,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
