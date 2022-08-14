import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/providers/db_provider.dart';
import 'package:todo_db_provider/views/widgets/task_widget.dart';

class AllTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DbProvider>(builder: (context, provider, x) {
      return provider.allTasks.isEmpty
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
                  "There Is No Tasks",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ))
          : ListView.builder(
              itemCount: provider.allTasks.length,
              itemBuilder: (context, index) {
                return TaskWidget(provider.allTasks[index]);
              });
    });
  }
}
