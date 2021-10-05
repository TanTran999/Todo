import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/theme/const.dart';
import 'package:todo_app/widgets/primary_button.dart';
import 'package:todo_app/widgets/text_field_one_line.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  bool _saving = false;
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

              //begin username text field
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

              //begin password text field
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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/register");
                },
                child: Text(
                  "Sign Up",
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
                      label: "Log In",
                      onPress: () async{
                        try {
                      setState(() {
                        _saving = true;
                      });
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email!, password: password!);
                      
                        setState(() {
                          _saving = false;
                        });
                        Navigator.pushNamed(context, "/list");
                      
                    } catch (e) {
                      print(e);
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
