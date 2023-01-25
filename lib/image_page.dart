import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Hero(
          tag: "masjid",
          child: CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/1.jpg"),
          ),
        ),
      ),
    );
  }
}
