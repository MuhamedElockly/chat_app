import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class CustomChatPubble extends StatelessWidget {
  const CustomChatPubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: Text(
          'I\'m Mohamed Elockly',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
