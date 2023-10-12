import 'package:flutter/material.dart';



ScaffoldFeatureController<SnackBar, SnackBarClosedReason> defaultScaffoldToast(
    {required BuildContext context,
      String? msg,
      bool isSuccess = false,
      Color? color}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
           msg?? '' ,

        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      clipBehavior: Clip.hardEdge,
      backgroundColor: isSuccess ? Colors.green : color ?? Colors.red,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      elevation: 10,
    ),
  );
}