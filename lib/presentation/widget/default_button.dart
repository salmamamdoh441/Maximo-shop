import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  double? width = double.infinity;
  Color? background = Colors.blue;
  bool? isUpperCase = true;
  void Function() function;
  String text;
  DefaultButton(
      {super.key,
      this.width,
      this.background,
      this.isUpperCase,
      required this.function,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase! ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
    ;
  }
}
