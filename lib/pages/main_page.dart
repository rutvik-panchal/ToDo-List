import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/data/models/Notes.dart';
import 'package:todoapp/data/db_helper.dart';
import 'package:todoapp/pages/add_note_page.dart';
import 'package:todoapp/widgets/todo_list_box.dart';

class MainPage extends StatefulWidget {
  MainPage();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Notes> notesList;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    if (notesList == null) {
      notesList = List<Notes>();
      updateNotesList();
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
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                itemCount: notesList.length,
                itemBuilder: (context, index) {
                  Notes note = notesList[index];
                  return ToDoListBox(note.title, note.description, note.isDone);
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToAddNotes();
        },
        child: Icon(Icons.add),
        heroTag: "Add Notes",
        backgroundColor: Colors.indigo,
      ),
    );
  }

  void navigateToAddNotes() async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddNotePage()));
    if (result != null) {
      addNotesList(result);
    }
  }

  void updateNotesList() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Notes>> noteListFuture = databaseHelper.getNotesList();
      noteListFuture.then((noteList) {
        setState(() {
          this.notesList = noteList;
        });
      });
    });
  }

  void addNotesList(Notes note) {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<int> addNoteFuture = databaseHelper.insertNote(note);
      addNoteFuture.then((noteList) {
        Future<List<Notes>> noteListFuture = databaseHelper.getNotesList();
        noteListFuture.then((noteList) {
          setState(() {
            this.notesList = noteList;
          });
        });
      });
    });
  }
}

Widget noNotesMessage = Container(
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/graphics/no_notes.png', width: 150, height: 150),
        SizedBox(height: 10),
        Text(
          'All work done!',
          style: TextStyle(fontSize: 15, color: Colors.grey[400]),
        ),
      ],
    ),
  ),
);
