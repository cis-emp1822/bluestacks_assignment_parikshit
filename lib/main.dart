import 'package:bluestacks_assignment_parikshit/helpers/restart_widget.dart';
import 'package:bluestacks_assignment_parikshit/views/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const RestartWidget(child: SplashPage());
  }
}
