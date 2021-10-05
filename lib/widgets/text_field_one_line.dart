import 'package:flutter/material.dart';
import 'package:todo_app/store/models.dart';
import 'package:todo_app/theme/const.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class TextFieldOneLine extends StatefulWidget {
  final String hintText;
  final int maxLenght;
  final bool isPassword;
  final bool showCounting;
  final Function(String)? callback;
  TextFieldOneLine(
      {
      this.callback,
      this.hintText = "",
      this.maxLenght = 100,
      this.isPassword = false,
      this.showCounting = false});

  @override
  _TextFieldOneLineState createState() => _TextFieldOneLineState();
}

class _TextFieldOneLineState extends State<TextFieldOneLine> {
  final myController = TextEditingController();
  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }
    @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.callback,
      focusNode: myFocusNode,
      controller: myController,
      maxLength: widget.maxLenght,
      textAlign: TextAlign.left,
      obscureText: widget.isPassword,
      //focusNode: _focus,
      cursorColor: kTextColor,
      style: TextStyle(fontSize: 14, color: kTextColor),
      decoration: InputDecoration(
        counter: widget.showCounting ? null : Offstage(),
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
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Color(0xFFAAAAAA),
          fontSize: 14,
        ),
      ),
    );
  }
}
