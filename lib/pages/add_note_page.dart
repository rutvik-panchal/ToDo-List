import 'package:flutter/material.dart';

class AddNotePage extends StatefulWidget {
  AddNotePage();

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notes'),
        centerTitle: true,
      ),
      body: Container(
        width: _size.width,
        height: _size.height,
        padding: EdgeInsets.only(
          top: 10,
          bottom: 15,
          left: 10,
          right: 10,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/graphics/add_notes.png',
                        width: 200, height: 200),
                    title,
                    SizedBox(height: 10),
                    subtitle,
                  ],
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              child: Container(
                width: _size.width,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Add Note',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget title = TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Title',
  ),
);

Widget subtitle = TextField(
  maxLines: null,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Description',
  ),
);
