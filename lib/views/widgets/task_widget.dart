import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/models/task_model.dart';
import 'package:todo_db_provider/providers/db_provider.dart';

// ignore: must_be_immutable
class TaskWidget extends StatelessWidget {
  TaskModel taskModel;
  // ignore: use_key_in_widget_constructors
  TaskWidget(this.taskModel);
  @override
  Widget build(BuildContext context) {
    return Consumer<DbProvider>(builder: (context, provider, x) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Slidable(
              key: UniqueKey(),
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    borderRadius: BorderRadius.circular(10),
                    onPressed: (v) {
                      provider.deleteTask(taskModel);
                    },
                    backgroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    borderRadius: BorderRadius.circular(10),
                    onPressed: (doNothing) {
                      // provider.updateTask(taskModel);
                    },
                    backgroundColor: const Color(0xff6035D0),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                    ),
                    BoxShadow(
                      color: Colors.white,
                    ),
                  ],
                ),
                child: CheckboxListTile(
                  activeColor: Colors.black,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  tileColor: Colors.white,
                  secondary: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.deepPurple, width: 4),

                      // Color(int.parse(
                      //     taskModel.currentColor ?? "ff443a49",
                      //     radix: 16)),
                      // width: 4),
                    ),
                  ),
                  value: taskModel.isComplete,
                  onChanged: (v) {
                    provider.updateTask(taskModel);
                  },
                  title: Text(
                    taskModel.title!,
                    style: const TextStyle(
                      fontFamily: 'CircularStd-Bold',
                      fontSize: 18,
                      color: Color(0xff000000),
                    ),
                  ),
                  subtitle: Column(
                    children: [
                      const SizedBox(height: 6),
                      Text(
                        taskModel.description!,
                        style: const TextStyle(
                          fontFamily: 'CircularStd-Medium',
                          fontSize: 16,
                          color: Color(0xffaeaeae),
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Category: ",
                            style: TextStyle(
                              fontFamily: 'AvenirNextRoundedPro-Medium',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff313131),
                            ),
                          ),
                          Text(
                            taskModel.category!,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Text(
                          //   "Selected Color " +
                          //       taskModel.currentColor.toString(),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
