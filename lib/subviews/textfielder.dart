import 'package:flutter/material.dart';

class TextFielder extends StatelessWidget {
  const TextFielder(
      {Key? key,
      this.action,
      this.controller,
      this.type,
      this.focusNode,
      this.label,
      this.nextNode})
      : super(key: key);
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputAction? action;
  final TextInputType? type;
  final FocusNode? nextNode;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      child: TextField(
        decoration: InputDecoration(
            hintText: label,
            alignLabelWithHint: true,
            // floatingLabelAlignment: FloatingLabelAlignment.start,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(13))),
        focusNode: focusNode,
        controller: controller,
        textAlign: TextAlign.center,
        textInputAction: action,
        obscureText: type == TextInputType.visiblePassword,
        keyboardType: type,
        onSubmitted: (str) => nextNode != null
            ? FocusScope.of(context).requestFocus(nextNode)
            : FocusScope.of(context).unfocus(),
      ),
    );
  }
}
