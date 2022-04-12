import 'package:flutter/material.dart';

import '../search_screen.dart';

class FilterTile extends StatelessWidget {
  final String imgurl, fildata;

  const FilterTile({Key? key, required this.imgurl, required this.fildata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SearchScreen(
                      searchQuery: fildata,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(width: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(imgurl, height: 70, width: 70),
            ),
            const SizedBox(width: 15),
            Text(
              fildata,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
