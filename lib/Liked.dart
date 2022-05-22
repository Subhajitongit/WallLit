import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Text(
                "Feature Coming Soon!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 29,
                ),
              ),
            ),
          ),
          SizedBox(height: 450),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Explore Wallpapers!"),
          )
        ],
      ),
    );
  }
}
