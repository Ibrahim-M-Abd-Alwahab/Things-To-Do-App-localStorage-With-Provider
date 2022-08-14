import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_db_provider/models/task_model.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper();
  DbHelper() {
    initDatabase();
  }

  static const String tableName = 'tasks';
  static const String taskIdColumName = 'id';
  static const String taskNameColumName = 'taskName';
  static const String taskDescriptionColumName = 'taskDescription';
  static const String taskCategoryColumName = 'taskCategory';
  static const String taskCurrentColorColumName = 'currentColor';
  static const String taskIsCompleteColumName = 'taskComplete';
  Database? database;
  initDatabase() async {
    database = await createConnectionWithDatabase();
  }

  Future<Database> createConnectionWithDatabase() async {
    String databasePath = await getDatabasesPath();
    String databaseName = 'tasks.db';
    String fullPath = join(databasePath, databaseName);
    Database database =
        await openDatabase(fullPath, version: 1, onCreate: (db, i) {
      log('hello, the database has been created');

      db.execute('''
 CREATE TABLE $tableName (
  $taskIdColumName INTEGER PRIMARY KEY AUTOINCREMENT,
  $taskNameColumName TEXT,
  $taskDescriptionColumName TEXT,
  $taskCategoryColumName TEXT,
  $taskCurrentColorColumName TEXT,
  $taskIsCompleteColumName INTEGER)
''');
    }, onOpen: (db) async {
      final tables = await db.rawQuery('SELECT * FROM $tableName');
      log("Colums Names: " + tables.toString());
    });
    return database;
  }

  insertNewTask(TaskModel taskModel) async {
    int rowIndex = await database!.insert(tableName, taskModel.toMap());
    log(rowIndex.toString());
  }

  Future<List<TaskModel>> selectAllTasks() async {
    List<Map<String, Object?>> rowsAsMaps = await database!.query(tableName);
    List<TaskModel> tasks =
        rowsAsMaps.map((e) => TaskModel.fromMap(e)).toList();
    return tasks;
  }

  selectOneTask(int id) {
    database!.query(tableName, where: '$taskIdColumName=?', whereArgs: [id]);
  }

  updateOneTask(TaskModel taskModel) async {
    int count = await database!.update(tableName, taskModel.toMap(),
        where: '$taskIdColumName=?', whereArgs: [taskModel.id]);
    log(count.toString());
  }

  deleteOneTask(int id) {
    database!.delete(tableName, where: '$taskIdColumName=?', whereArgs: [id]);
  }
}
