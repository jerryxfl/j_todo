import 'package:jerry_todo/bean/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import 'constants.dart';

class SqliteHelper {

  String _dbPath;
  String _dbName = "task.db";
  Database _db;

  initDB() async {
    _dbPath = await getDatabasesPath();
    _db = await openDatabase(p.join(_dbPath,_dbName),onCreate: (database,version) async {
      //创建task表
      database.execute('''
      create table task(
          id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
          icon TEXT NOT NULL,
          title TEXT NOT NULL,
          time INTEGER NOT NULL,
          isDone INTEGER NOT NULL
      )
      ''');


      //创建todo表
      database.execute('''
      create table todo(
          id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
          taskId INTEGER NOT NULL,
          startTime INTEGER NOT NULL,
          endTime INTEGER NOT NULL,
          isDone INTEGER NOT NULL
      )
      ''');
    },version: Constants.databaseVersion);
  }

  getTasks() async{
    await initDB();

    await _db.close();

  }

}

