import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_task/add_task_screen.dart';
import 'package:todo_app/screens/list_task/list_task_screen.dart';
import 'package:todo_app/screens/register_screen/register_screen.dart';
import 'package:todo_app/store/models.dart';
import 'package:todo_app/store/reducers.dart';
import 'screens/login_screen/login_screen.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Store<NoteDetail> _store =
      Store<NoteDetail>(noteDetailReducer, initialState: NoteDetail(time: DateTime.now()));

  @override
  Widget build(BuildContext context) {
    return StoreProvider(store: _store, child: 
      MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => LoginScreen(),
          "/register": (context) => RegisterScreen(),
          "/add": (context) => AddTaskScreen(),
          "/list": (context) => ListTaskScreen(),
        },
      ),
    );
  }
}
