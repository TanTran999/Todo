import 'package:flutter/material.dart';
import 'package:todo_app/theme/const.dart';

class PrimaryButton extends StatelessWidget {
  final Color colour;
  final String label;
  final Function()? onPress;

  PrimaryButton(
    {
      this.colour = kMainColor,
      this.label ="Button",
      this.onPress,
    }
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
            child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
