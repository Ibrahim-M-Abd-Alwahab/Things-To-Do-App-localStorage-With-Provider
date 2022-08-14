import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/models/task_model.dart';
import 'package:todo_db_provider/providers/db_provider.dart';
import 'package:todo_db_provider/views/widgets/task_widget.dart';

class InCompleteTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Selector<DbProvider, List<TaskModel>>(selector: (context, provider) {
      return provider.inCompleteTasks;
    }, builder: (context, returnedVariableFromSelector, x) {
      return returnedVariableFromSelector.isEmpty
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage(
                    "assets/images/clipboard.png",
                  ),
                  height: 150,
                  width: 150,
                ),
                SizedBox(height: 20),
                Text(
                  "All Tasks Done",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ))
          : ListView.builder(
              itemCount: returnedVariableFromSelector.length,
              itemBuilder: (context, index) {
                return TaskWidget(
                  returnedVariableFromSelector[index],
                );
              });
    });
  }
}
