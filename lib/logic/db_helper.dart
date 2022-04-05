import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task/logic/task_model.dart';

class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  static Database? _database;

  // _database.

  Future get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initializeDb();
      return _database;
    }
  }

  initializeDb() async {
    var dir = await getDatabasesPath();

    var path = join(dir, "task.db");

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute("""
        CREATE TABLE tasks(
          id INTEGER PRIMARY KEY,
          title TEXT,
          begin TEXT,
          end TEXT,
          description TEXT,
          color TEXT
        )
      """);
    });
  }

  Future<int> addNewTask(Task newtask) async {
    Database db = await database;
    return await db.insert("tasks", newtask.toJson(),
        conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<List<Task>> getTasks() async {
    List<Task> taskList = [];
    final db = await database;
    var result = await db.query("tasks");
    if (result.length == 0) {
      return taskList;
    } else {
      result.forEach((task) {
        var taskeach = Task.fromJson(task);
        taskList.add(taskeach);
      });
      notifyListeners();
      return taskList;
      // var resultMAp = result.toList();
      // return resultMAp.isNotEmpty ? resultMAp : Null;
    }
  }

  Future<void> delete(int id) async {
    var db = await database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
