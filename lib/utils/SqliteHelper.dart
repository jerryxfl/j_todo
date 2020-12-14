import 'package:jerry_todo/bean/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import 'constants.dart';

class SqliteHelper {
  String _dbPath;
  String _dbName = "jerry.db";
  Database _db;

  initDB() async {
    _dbPath = await getDatabasesPath();
    _db = await openDatabase(p.join(_dbPath, _dbName),
        onCreate: (database, version) async {
          //创建task表
          database.execute('''
          create table task(
              id INTEGER NOT NULL PRIMARY KEY,
              icon TEXT NOT NULL,
              title TEXT NOT NULL,
              time INTEGER NOT NULL,
              isDone INTEGER NOT NULL
          )
          ''');

          //创建todo表
          database.execute('''
          create table todo(
              id INTEGER NOT NULL PRIMARY KEY,
              taskId INTEGER NOT NULL,
              startTime INTEGER NOT NULL,
              endTime INTEGER NOT NULL,
              content TEXT NOT NULL,
              isDone INTEGER NOT NULL
          )
          ''');
        }, version: Constants.databaseVersion);
  }




  Future<List<Task>> getTasks() async {
    await initDB();
    List<Task> tasks = (await _db.rawQuery("select * from task")).cast<Task>();
    await _db.close();
    return tasks;
  }

  addTask(Task task) async{
    await initDB();
    _db.insert("task", task.toJson());
    await _db.close();
  }

}
