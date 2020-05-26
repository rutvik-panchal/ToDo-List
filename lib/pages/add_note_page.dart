import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/data/models/Notes.dart';

class AddNotePage extends StatelessWidget {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  String imagePath = "";
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notes'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) => Container(
          width: _size.width,
          height: _size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/graphics/add_notes.png',
                            width: 200, height: 200),
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: descController,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Description',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () { selectImage(); },
                      color: Theme.of(context).primaryColor,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: _size.width,
                        child: Center(
                          child: Text(
                            'Add Image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        final snackBar = SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text('Please enter all the fields!'),
                        );
                        String title = titleController.text.trim();
                        String description = descController.text.trim();
                        if (title.isNotEmpty && description.isNotEmpty) {
                          Notes note = Notes(title, description, false, imagePath);
                          Navigator.pop(context, note);
                        } else {
                          Scaffold.of(context).showSnackBar(snackBar);
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: _size.width,
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
            ],
          ),
        ),
      ),
    );
  }
  void selectImage() async {
    File image = await FilePicker.getFile(type: FileType.image);
    this.imagePath = image.path;
  }
}