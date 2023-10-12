import 'package:flutter/material.dart';

class Divider extends StatelessWidget {
  const Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20,),
      child: Container(
        height: 1, width: double.infinity, color: Colors.grey[300],),
    );
  }
}
