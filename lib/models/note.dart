
import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String id;
  String title;
  String note;
  String color;
  String status;
  Timestamp time;

  Note({
    required this.id,
    this.title = "",
    this.note = "",
    this.color ="kMainColor",
    this.status ="To DO",
    required this.time,
  });

  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      note: map['note'],
      color: map['color'],
      status: map['status'],
      time: map['time'],
    );
  }
}