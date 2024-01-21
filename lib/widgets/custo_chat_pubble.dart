import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class CustomChatPubble extends StatelessWidget {
  const CustomChatPubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.only(left: 16),
      height: 56,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Text(
        'I\'m Mohamed Mahmoud ',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
