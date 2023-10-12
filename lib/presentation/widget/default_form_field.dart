import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  void Function(String)? onSubmit;
  void Function(String)? onChange;
  void Function()? onTap;
  Widget? suffixIcon;


  String? Function(String?)? validate;

  String label;

  IconData prefix;
  void Function()? suffixPressed;
  DefaultFormField({
    super.key,
    required this.controller,
    required this.type,
    this.onSubmit,
    this.onChange,
    required this.validate,
    required this.prefix,
    required this.label,
    this.onTap,
    this.suffixIcon

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
