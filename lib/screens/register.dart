import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/screens/cubits/RegisterCubit/cubit/register_cubit.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  String? email;

  String? passward;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          isLoading = false;
          Navigator.pushNamed(context, 'ChatPage');
          showSnackBar(context, 'Success');
        } else if (state is RegisterFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (BuildContext context, RegisterState state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    Image.asset('assets/images/scholar.png'),
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'pacifico',
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      obscureText: false,
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      obscureText: true,
                      onChanged: (data) {
                        passward = data;
                      },
                      hintText: 'Passward',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context)
                                .registerUser(
                                    email: email!, passward: passward!);
                          } else {}
                        },
                        buttonText: 'REGISTER'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'already have an account ? ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'LogIn',
                            style: TextStyle(
                                color: Color(0XFFC7EDE6), fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
