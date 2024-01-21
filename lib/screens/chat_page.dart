import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custo_chat_pubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 70,
            ),
            Text(
              'Chat',
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: CustomChatPubble(),
    );
  }
}


