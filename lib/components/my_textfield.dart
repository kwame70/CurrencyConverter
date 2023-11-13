import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField(
      {super.key, required this.hintText, required this.controller});

  final String hintText;
  final TextEditingController controller;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          focusedBorder: border,
          enabledBorder: border,
          prefixIcon: const Icon(Icons.monetization_on_outlined),
          prefixIconColor: Colors.black,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
