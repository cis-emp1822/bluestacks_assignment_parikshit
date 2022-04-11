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
                    primarySwatch: Colors.blue,
                  ),
                  builder: (context, child) {
                    if (snapshot.data!.hasData('is_login')) {
                      return const HomeScreen();
                    } else {
                      return const LoginScreen();
                    }
                  },
                ));
          }
          return Container(
            color: Colors.black,
          );
        });
  }
}
