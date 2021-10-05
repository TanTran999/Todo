import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_app/store/actions.dart';
import 'package:todo_app/store/models.dart';
import 'package:todo_app/theme/const.dart';

class ColorCheck extends StatelessWidget {
  final Color colour;
  final Function()? callback;
  final bool check;

  const ColorCheck({
    this.check = false,
    this.callback,
    this.colour = kMainColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        child: Center(
          child: Icon(
            Icons.check,
            color: check ? Colors.white : colour,
            size: 20,
          ),
        ),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class SelectColor extends StatefulWidget {
  const SelectColor({
    Key? key,
  }) : super(key: key);

  @override
  _SelectColorState createState() => _SelectColorState();
}

List<String> stringSelect = [
  "kMainColor",
  "kSubColor1",
  "kSubColor2",
];

class _SelectColorState extends State<SelectColor> {
  String select = stringSelect[0];
  @override
  Widget build(BuildContext context) {
    return StoreConnector<NoteDetail, String>(
      converter: (store) {
        return store.state.color;
      },
      builder: (context, color) => Row(
        children: [
          ColorCheck(
            callback: () {
              setState(() {
                select = stringSelect[0];
                StoreProvider.of<NoteDetail>(context).dispatch(
                  AddColor(
                    color: stringSelect[0],
                  ),
                );
              });
            },
            check: select == "kMainColor" ? true : false,
          ),
          SizedBox(
            width: 16,
          ),
          ColorCheck(
            colour: ksubColor1,
            callback: () {
              setState(() {
                select = stringSelect[1];
                 StoreProvider.of<NoteDetail>(context).dispatch(
                  AddColor(
                    color: stringSelect[1],
                  ),
                );
              });
            },
            check: select == "kSubColor1" ? true : false,
          ),
          SizedBox(
            width: 16,
          ),
          ColorCheck(
            colour: ksubColor2,
            callback: () {
              setState(() {
                select = stringSelect[2];
                 StoreProvider.of<NoteDetail>(context).dispatch(
                  AddColor(
                    color: stringSelect[2],
                  ),
                );
              });
            },
            check: select == "kSubColor2" ? true : false,
          ),
        ],
      ),
    );
  }
}
