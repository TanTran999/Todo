class NoteDetail {
  DateTime time;
  String title;
  String note;
  String color;
  NoteDetail({
    required this.time,
    this.title  = "",
    this.color = "kMainColor",
    this.note = "",
  });
}