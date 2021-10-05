import 'package:todo_app/store/actions.dart';
import 'package:todo_app/store/models.dart';

NoteDetail noteDetailReducer(NoteDetail note, dynamic action) {
  if (action is AddTitle) {
    return NoteDetail(time: DateTime.now(), title: action.title, note: note.note, color: note.color);
  }
  if (action is AddNote) {
    return NoteDetail(time: DateTime.now(), title: note.title, note: action.note, color: note.color);
  }
  if (action is AddColor) {
    return NoteDetail(time: DateTime.now(), title: note.title, note: note.note, color: action.color);
  }
  return note;
}