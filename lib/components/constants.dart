
import 'package:flutter/material.dart';
import 'package:shopping_app/network/local/cache_helper.dart';
import 'package:shopping_app/presentation/screens/login/login_screen.dart';

String? token='';
void printFullText(String? text){
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text!).forEach((match) =>print(match.group(0)));
}
void signOut(context){
  CacheHelper.removeData(key: 'token').then((value) {
    if(value){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) =>  LoginScreen()),
            (route) => false,
      );
    }
  });
}