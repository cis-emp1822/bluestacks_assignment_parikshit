import 'package:flutter/material.dart';

class Cdivider extends StatelessWidget {
  const Cdivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF3366FF),
              Color(0xFF00CCFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }
}
