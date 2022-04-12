// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:wall_it/image_view.dart';
import 'package:wall_it/models/wallpaper_model.dart';

class WallpaperList extends StatefulWidget {
  List<WallpaperModel> walls;
  BuildContext context;
  WallpaperList({
    Key? key,
    required this.walls,
    required this.context,
  }) : super(key: key);
  @override
  State<WallpaperList> createState() => _WallpaperListState();
}

class _WallpaperListState extends State<WallpaperList> {
  Color hert = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          physics: ScrollPhysics(),
          childAspectRatio: 0.65,
          mainAxisSpacing: 2,
          crossAxisSpacing: 6,
          children: widget.walls.map((wallpaper) {
            return GridTile(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ImageView(imgUrl: wallpaper.src!.portrait),
                    ),
                  );
                },
                child: Hero(
                  tag: wallpaper.src!.portrait,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          wallpaper.src!.portrait,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, top: 200),
                        child: Material(
                          color: Colors.transparent,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.heart_fill,
                                color: hert,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// Color hert = Colors.white;

// Widget WallpaperList({required List<WallpaperModel> walls, context}) {
//   return 
// }
