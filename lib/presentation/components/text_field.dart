import 'package:flutter/material.dart';

class TTextField extends StatelessWidget {
  const TTextField(
      {super.key,
      required this.controller,
      required this.onButtonPressed,
      required this.labelText,
      required this.hintText});
  final TextEditingController controller;
  final String labelText, hintText;
  final Function(String) onButtonPressed;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
