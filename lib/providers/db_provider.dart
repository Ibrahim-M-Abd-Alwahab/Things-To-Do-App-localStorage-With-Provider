import 'package:flutter/material.dart';
import 'package:todo_db_provider/data/db_helper.dart';
import 'package:todo_db_provider/models/task_model.dart';

class DbProvider extends ChangeNotifier {
  DbProvider() {
    selectAllTasks();
  }
  List<TaskModel> allTasks = [];
  List<TaskModel> completeTasks = [];
  List<TaskModel> inCompleteTasks = [];
  fillLists(List<TaskModel> tasks) {
    allTasks = tasks;
    completeTasks = tasks.where((element) => element.isComplete).toList();
    inCompleteTasks = tasks.where((element) => !element.isComplete).toList();
    notifyListeners();
  }

  addTaskToList(TaskModel taskModel) {
    allTasks.add(taskModel);
    fillLists(allTasks);
  }

  createNewTask(TaskModel taskModel) async {
    await DbHelper.dbHelper.insertNewTask(taskModel);
    addTaskToList(taskModel);
  }

  selectAllTasks() async {
    List<TaskModel> tasks = await DbHelper.dbHelper.selectAllTasks();
    fillLists(tasks);
  }

  deleteTask(TaskModel taskModel) async {
    await DbHelper.dbHelper.deleteOneTask(taskModel.id!);
    selectAllTasks();
  }

  updateTask(TaskModel taskModel) async {
    taskModel.isComplete = !taskModel.isComplete;
    await DbHelper.dbHelper.updateOneTask(taskModel);
    selectAllTasks();
  }

}
