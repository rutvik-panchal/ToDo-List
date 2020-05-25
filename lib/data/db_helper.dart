import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/data/models/Notes.dart';

class DatabaseHelper {

  static Database _database;
  static DatabaseHelper _databaseHelper;

  static String tableName = "notes";

  String createDatabaseQuery = "CREATE TABLE $tableName("
      "id INTEGER PRIMARY KEY,"
      "title TEXT,"
      "description TEXT,"
      "isdone INTEGER,"
      "image TEXT"
      ")";

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    String dbPath = await getDatabasesPath();
    var notesDatabase = await openDatabase(
        join(dbPath, 'todo_notes.db'),
        version: 1,
        onCreate: (db, version) {
          return db.execute(createDatabaseQuery);
        });
    return notesDatabase;
  }

  Future<int> insertNote(Notes note) async {
    Database db = await this.database;
    var result = await db.insert(tableName, note.toMap());
    return result;
  }

  Future<List<Notes>> getNotesList() async {
    final Database db = await this.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Notes(
        maps[i]['title'],
        maps[i]['description'],
        maps[i]['isdone'] == 1? true:false,
        maps[i]['image'],
      );
    });
  }
}