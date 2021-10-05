import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_app/models/connection_helper.dart';
import 'package:todo_app/store/actions.dart';
import 'package:todo_app/store/models.dart';
import 'package:todo_app/theme/const.dart';
import 'package:todo_app/widgets/primary_button.dart';
import 'package:todo_app/widgets/text_field_multi_line.dart';
import 'package:todo_app/widgets/text_field_one_line.dart';
import 'package:todo_app/screens/add_task/components.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Add Task",
          // overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            color: kTextColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          iconSize: 20,
          color: Colors.black,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 32),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              //begin title text field
              Row(
                children: [
                  Text(
                    "Title",
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
              StoreConnector<NoteDetail, String>(
                converter: (store) {
                  return store.state.title;
                },
                builder: (context, title) => TextFieldOneLine(
                  callback: (value) {
                    StoreProvider.of<NoteDetail>(context).dispatch(
                      AddTitle(
                        title: value,
                        ),
                    );
                  },
                  hintText: "Enter title here.",
                  maxLenght: 30,
                  showCounting: true,
                ),
              ),
              SizedBox(
                height: 16,
              ),

              //begin note text field
              Row(
                children: [
                  Text(
                    "Note",
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
              StoreConnector<NoteDetail, String>(
                converter: (store) {
                  return store.state.note;
                },
                builder:(context, note) => TextFieldMultiLine(
                  callback: (value) {
                    StoreProvider.of<NoteDetail>(context).dispatch(
                      AddNote(
                        note: value,
                      ),
                    );
                  },
                  hintText: "Enter note here.",
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Color",
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
              SelectColor(),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    StoreConnector<NoteDetail, NoteDetail>(
                      converter: (store) {
                        return store.state;
                      },
                      builder: (context, notedetail) => PrimaryButton(
                        label: "Create Task",
                        onPress: () async{
                          await firestore.collection("todo").add({
                            "time": notedetail.time,
                            "title": notedetail.title,
                            "note": notedetail.note,
                            "color": notedetail.color,
                            "status": "TO DO",
                          });
                          print(notedetail.title + notedetail.note + notedetail.color);
                          Navigator.pop(context);
                        },
                      ),
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
