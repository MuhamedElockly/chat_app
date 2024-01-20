import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.buttonText});
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      height: 65,
      child: Center(
        child: Text(
          buttonText,
        ),
      ),
    );
  }
}
