import 'package:flutter/material.dart';
import 'package:todo_app/theme/const.dart';
import 'package:todo_app/widgets/primary_button.dart';
import 'package:todo_app/widgets/text_field_one_line.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  String? confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 24, right: 16, left: 16, bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "TODO APP",
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 32,
              ),

              //begin username field
              Row(
                children: [
                  Text(
                    "User Name",
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TextFieldOneLine(
                callback: (value) {
                  setState(() {
                    email = value;
                  });
                },
                hintText: "User Name",
              ),
              SizedBox(
                height: 16,
              ),

              //begin password field
              Row(
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TextFieldOneLine(
                callback: (value) {
                  setState(() {
                    password = value;
                  });
                },
                isPassword: true,
                hintText: "Password",
              ),
              SizedBox(
                height: 16,
              ),

              //begin confirm password field
              Row(
                children: [
                  Text(
                    "Confirm Password",
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TextFieldOneLine(
                callback: (value) {
                  setState(() {
                    confirmPassword = value;
                  });
                },
                isPassword: true,
                hintText: "Confirm Password",
              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/");
                },
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 14,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PrimaryButton(
                      label: "Sign Up",
                      onPress: () async {
                        if (password == confirmPassword) {
                          print(email! + password!);
                          try {
                            await _auth.createUserWithEmailAndPassword(
                                email: email!, password: password!);
                            Navigator.pushNamed(context, "/");
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
