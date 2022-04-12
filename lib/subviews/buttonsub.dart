import 'package:flutter/cupertino.dart';

class ButtonSub extends StatelessWidget {
  const ButtonSub({Key? key, this.onGo, this.label}) : super(key: key);
  final VoidCallback? onGo;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
        child: Text(label ?? ''), onPressed: onGo ?? () {});
  }
}
