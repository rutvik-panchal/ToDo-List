import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoListBox extends StatefulWidget {
  String title;
  String description;
  bool isChecked;

  ToDoListBox(this.title, this.description, this.isChecked);

  @override
  _ToDoListBoxState createState() => new _ToDoListBoxState();
}

class _ToDoListBoxState extends State<ToDoListBox> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        top: 4,
        left: 8,
        right: 8,
        bottom: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 16),
        child: Row(
          children: <Widget>[
            Checkbox(
                value: widget.isChecked,
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                onChanged: (bool value) {
                  changeCheckBoxValue(value);
                }),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Text(widget.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeCheckBoxValue(bool value) => setState(() {
        if (widget.isChecked) {
          widget.isChecked = false;
        } else {
          widget.isChecked = true;
        }
      });
}
