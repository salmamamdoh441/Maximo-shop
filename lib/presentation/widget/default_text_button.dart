import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
   DefaultTextButton({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed:onPressed,
        child:  Text(text));
  }
}
