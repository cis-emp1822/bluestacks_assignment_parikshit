import 'package:bluestacks_assignment_parikshit/helpers/assets.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(15), bottomStart: Radius.circular(15)),
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
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Image.asset(Assets.game_tv_logo),
    );
  }
}
