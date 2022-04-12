// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wall_it/search_screen.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  TextEditingController searchQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Image.network(
            "https://images.pexels.com/photos/1416367/pexels-photo-1416367.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            colorBlendMode: BlendMode.darken,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text("Wall",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50)),
              Text("Lit🔥",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 60)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 160.0, left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: searchQuery,
              onSubmitted: (searchQuery) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SearchScreen(searchQuery: searchQuery),
                  ),
                );
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                hintText: "Search among 50,000+ wallpapers...",
                hintStyle: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
