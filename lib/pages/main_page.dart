import 'package:flutter/material.dart';
import 'package:todoapp/data/Notes.dart';
import 'package:todoapp/pages/add_note_page.dart';
import 'package:todoapp/widgets/todo_list_box.dart';

class MainPage extends StatefulWidget {
  MainPage();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Notes> notesList;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    if (notesList == null) {
      notesList = List<Notes>();
      notesList.add(Notes('Title', 'Blah Blah', false));
      notesList.add(Notes('Happyyyyyyy', 'Test', true));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        centerTitle: true,
      ),
      body: notesList.length == 0
          ? noNotesMessage
          : Container(
              width: _size.width,
              height: _size.height,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: ListView.builder(
                itemCount: notesList.length,
                itemBuilder:  (context, index) {
                  Notes note = notesList[index];
                  return ToDoListBox(note.title, note.description, note.isDone);
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNotePage()));
        },
        child: Icon(Icons.add),
        heroTag: "Add Notes",
        backgroundColor: Colors.indigo,
      ),
    );
  }
}

Widget noNotesMessage = Container(
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/graphics/no_notes.png', width: 150, height: 150),
        SizedBox(height: 10),
        Text('All work done!', style: TextStyle(fontSize: 15, color: Colors.grey[400]),),
      ],
    ),
  ),
);
