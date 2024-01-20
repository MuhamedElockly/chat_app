import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B475E),
      body: Column(
        children: [
          Image.asset('assets/images/scholar.png'),
          Text(
            'Scholar Chat',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontFamily: 'pacifico',
            ),
          ),
          Text(
            'LOGIN',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          CustomTextField(
            hintText: 'Email',
          ),
          CustomTextField(
            hintText: 'Passward',
          ),
        ],
      ),
    );
  }
}
