import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/connection_helper.dart';
import 'package:todo_app/models/note.dart';
import 'package:todo_app/theme/const.dart';
import 'components.dart';

class ListTaskScreen extends StatefulWidget {
  //final _firestore = FirebaseFirestore.instance;
  @override
  _ListTaskScreenState createState() => _ListTaskScreenState();
}

class _ListTaskScreenState extends State<ListTaskScreen> {
  User? loggedInUser;
  final _auth = FirebaseAuth.instance;
  String email ="";
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        email = user.email!;
        print(email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: GestureDetector(
          onTap: () async {
            await _auth.signOut();
            //Navigator.pushNamed(context, "/");
            Navigator.pop(context);
          },
          child: Text(
            email,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              color: kTextColor,
            ),
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          iconSize: 20,
          color: Colors.black,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          icon: Icon(
            Icons.dark_mode_outlined,
          ),
          onPressed: () {},
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 16),
            height: 100,
            width: 101,
            color: Colors.transparent,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/add");
                },
                child: Container(
                  height: 30,
                  width: 95,
                  child: Center(
                    child: Text(
                      "Add Task",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
        child: StreamBuilder<QuerySnapshot>(
            stream:
            //  _firestore
            //     .collection('todo')
            //     .orderBy('time', descending: true)
            //     .snapshots(),
            getNotes,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              List<Note> notes = [];
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final listnotes = snapshot.data!.docs;
                for (var note in listnotes) {
                  final id = note.id;
                  final time = note.get('time');
                  final title = note.get('title');
                  final detail = note.get('note');
                  final status = note.get('status');
                  final color = note.get('color');
                  final Note noteCard = Note(
                    id: id,
                    time: time,
                    title: title,
                    note: detail,
                    status: status,
                    color: color,
                  );
                  notes.add(noteCard);
                }
                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    Map<String, Color> mapColor = {
                      'kMainColor': kMainColor,
                      'kSubColor1': ksubColor1,
                      'kSubColor2': ksubColor2,
                    };
                    return ToDoCard(
                      id: notes[index].id,
                      title: notes[index].title,
                      colour: mapColor[notes[index].color] ?? ksubColor2,
                      note: notes[index].note,
                      status: notes[index].status,
                    );
                  },
                );
              }
            }),
        // ListView.builder(
        //   itemCount: 5,
        //   itemBuilder: (context, index) {
        //     return ToDoCard(
        //       title: "Learn Flutter",
        //       colour: kMainColor,
        //       note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. ",
        //       status: "DONE",
        //     );
        //   },
        // ),
      ),
    );
  }
}