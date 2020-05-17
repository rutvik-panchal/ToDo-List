import 'package:flutter/material.dart';

class AddNotePage extends StatelessWidget {

  final titleController = TextEditingController();
  final descController = TextEditingController();

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
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding (
                  padding: EdgeInsets.all(10),
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
            ),),
            RaisedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text(
                    'Please enter all the fields!'
                  ),
                );
                String title = titleController.text.trim();
                String description = descController.text.trim();
                if (title.isNotEmpty && description.isNotEmpty) {

                } else {

                }
                Scaffold.of(context).showSnackBar(snackBar);
              },
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

