import 'package:bluestacks_assignment_parikshit/helpers/globals.dart';
import 'package:bluestacks_assignment_parikshit/services/persist.dart';
import 'package:bluestacks_assignment_parikshit/views/home_screen.dart';
import 'package:bluestacks_assignment_parikshit/views/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  Future<GetStorage> initDB() async {
    await GetStorage.init();
    final box = GetStorage();
    return box;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetStorage>(
        future: initDB(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CupertinoApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[LinearProgressIndicator()],
                ),
              )),
            );
          }
          if (snapshot.hasData) {
            return Provider(
                create: (_) => Persist(db: snapshot.data),
                child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                        colorScheme: const ColorScheme(
                            brightness: Brightness.light,
                            secondary: Gcolors.greyColor,
                            onSecondary: Gcolors.greyColor,
                            primary: Colors.white,
                            onPrimary: Gcolors.backgroundColor,
                            error: Colors.deepOrange,
                            onError: Colors.deepOrange,
                            background: Gcolors.backgroundColor,
                            onBackground: Gcolors.backgroundColor,
                            surface: Gcolors.greyColor,
                            onSurface: Gcolors.greyColor)),
                    routes: {
                      HomeScreen.routeName: (context) => const HomeScreen(),
                      LoginScreen.routeName: (context) => const LoginScreen(),
                    },
                    home: const SplashChild()));
          }
          return Container(
            color: Colors.black,
          );
        });
  }
}

class SplashChild extends StatefulWidget {
  const SplashChild({Key? key, this.data = false}) : super(key: key);
  final bool data;
  @override
  State<SplashChild> createState() => _SplashChildState();
}

class _SplashChildState extends State<SplashChild> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (widget.data) {
      Navigator.pushNamed(context, HomeScreen.routeName);
    } else {
      Navigator.pushNamed(context, LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
