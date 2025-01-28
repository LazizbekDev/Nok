import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Color? borderColor; // Made nullable for default behavior
  final void Function(String)? onChanged; // Optional callback for input changes

  const Input({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.borderColor, // Optional parameter for dynamic border color
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Use the provided borderColor or default to Theme.of(context).colorScheme.tertiary
    final effectiveBorderColor =
        borderColor ?? Theme.of(context).colorScheme.tertiary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged, // Pass the onChanged callback if provided
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: effectiveBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: effectiveBorderColor),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
