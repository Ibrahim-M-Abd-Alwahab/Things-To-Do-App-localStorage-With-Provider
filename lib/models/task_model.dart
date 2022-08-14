import 'dart:ui';

import 'package:todo_db_provider/data/db_helper.dart';

class TaskModel {
  int? id;
  String? title;
  String? description;
  String? category;
  String? currentColor;
  late bool isComplete;
  TaskModel({
    required this.title,
    required this.description,
    required this.category,
    this.currentColor,
    this.isComplete = false,
  });
  TaskModel.fromMap(Map<String, dynamic> map) {
    id = map[DbHelper.taskIdColumName];
    title = map[DbHelper.taskNameColumName];
    description = map[DbHelper.taskDescriptionColumName];
    category = map[DbHelper.taskCategoryColumName];
    currentColor = map[DbHelper.taskCurrentColorColumName];
    isComplete = map[DbHelper.taskIsCompleteColumName] == 1 ? true : false;
  }
  Map<String, dynamic> toMap() {
    return {
      DbHelper.taskNameColumName: title,
      DbHelper.taskDescriptionColumName: description,
      DbHelper.taskCategoryColumName: category,
      DbHelper.taskCurrentColorColumName: currentColor,
      DbHelper.taskIsCompleteColumName: (isComplete) ? 1 : 0
    };
  }
}
