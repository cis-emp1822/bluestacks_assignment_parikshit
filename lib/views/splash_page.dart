import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

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
            return Scaffold(
                body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[LinearProgressIndicator()],
              ),
            ));
          }
          return Container(
            color: Colors.black,
          );
        });
  }
}
