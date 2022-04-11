import 'package:flutter/material.dart';

class TextFielder extends StatelessWidget {
  const TextFielder(
      {Key? key,
      this.action,
      this.controller,
      this.type,
      this.focusNode,
      this.nextNode})
      : super(key: key);
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputAction? action;
  final TextInputType? type;
  final FocusNode? nextNode;
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      textInputAction: action,
      obscureText: type == TextInputType.visiblePassword,
      keyboardType: type,
      onSubmitted: (str) => nextNode != null
          ? FocusScope.of(context).requestFocus(nextNode)
          : FocusScope.of(context).unfocus(),
    );
  }
}
