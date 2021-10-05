import 'package:flutter/material.dart';
import 'package:todo_app/theme/const.dart';

class TextFieldMultiLine extends StatelessWidget {
  final String hintText;
  final int maxLenght;
  final bool isPassword;
  final Function(String)? callback;
  TextFieldMultiLine(
      {this.callback, this.hintText = "", this.maxLenght = 255, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: callback,
      maxLines: 5,
      maxLength: maxLenght,
      textAlign: TextAlign.left,
      obscureText: isPassword,
      //focusNode: _focus,
      cursorColor: kTextColor,
      style: TextStyle(fontSize: 14, color: kTextColor),
      decoration: InputDecoration(
        //counterText: "",
        contentPadding: EdgeInsets.fromLTRB(10, 17, 10, 17),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFAAAAAA), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFAAAAAA), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFAAAAAA), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xFFAAAAAA),
          fontSize: 14,
        ),
      ),
    );
  }
}
