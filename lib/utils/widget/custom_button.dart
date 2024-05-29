import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xffffffff);

    const double borderRadius = 15;

    return DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.green.shade300,
        ),
        child: TextButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Text(
              text,
              style: const TextStyle(color: accentColor, fontSize: 16),
            ),
          ),
        ));
  }
}
