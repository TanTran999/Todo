import 'dart:html';

import 'package:flutter/material.dart';
import 'package:todo_app/models/connection_helper.dart';
import 'package:todo_app/theme/const.dart';
import 'package:todo_app/widgets/primary_button.dart';

class ToDoCard extends StatelessWidget {
  final String id;
  final Color colour;
  final String title;
  final String note;
  final String status;

  ToDoCard({
    required this.id,
    this.colour = kMainColor,
    this.title = "",
    this.note = "",
    this.status = "TO DO",
  });

  Widget buildBottomSheet(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 32),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PrimaryButton(
            colour: kMainColor,
            label: "Task Completed",
            onPress: () async {
              await firestore.collection("todo").doc(id).update({"status": "DONE"});
              Navigator.pop(context);
            }
          ),
          SizedBox(
            height: 16,
          ),
          PrimaryButton(
            colour: ksubColor1,
            label: "Delete Task",
            onPress: () async {
              await firestore.collection("todo").doc(id).delete();
              Navigator.pop(context);
            }
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showModalBottomSheet(
            context: context,
            builder: buildBottomSheet,
            backgroundColor: Colors.transparent);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              height: 65,
              child: RichText(
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: note,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Divider(color: Colors.white),
            Text(
              status,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
