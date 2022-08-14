import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/models/task_model.dart';
import 'package:todo_db_provider/providers/db_provider.dart';

class NewTaskScreen extends StatefulWidget {
  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  String content = "";

  String description = "";

  String category = "";

  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => currentColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff7646FF),
          elevation: 0,
          title: Row(
            children: const [
              Text('New Task',
                  style: TextStyle(fontSize: 25, fontFamily: 'Roboto')),
              SizedBox(width: 3),
            ],
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => NewTaskScreen())));
                  },
                  icon: const Image(
                    image: AssetImage("assets/images/plus.png"),
                  ),
                ),
                const SizedBox(width: 10)
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Material(
                      borderRadius: const BorderRadius.all(Radius.circular(3)),
                      child: TextField(
                        decoration: const InputDecoration(
                            hintText: 'Name',
                            hintStyle: TextStyle(color: Color(0xff172735)),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 13)),
                        onChanged: (v) {
                          content = v;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      child: TextField(
                        maxLines: 4,
                        decoration: const InputDecoration(
                            hintText: 'Add description here',
                            hintStyle: TextStyle(color: Color(0xff172735)),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 13)),
                        onChanged: (v) {
                          description = v;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Material(
                      borderRadius: const BorderRadius.all(Radius.circular(3)),
                      child: TextField(
                        decoration: const InputDecoration(
                            hintText: 'Category',
                            hintStyle: TextStyle(color: Color(0xff172735)),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 13)),
                        onChanged: (v) {
                          category = v;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Choose Color",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff172735)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AlertDialog(
                                content: SingleChildScrollView(
                                  child: BlockPicker(
                                    pickerColor: currentColor,
                                    onColorChanged: changeColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // backgroundColor: const Color(0xff7646ff),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () async {
                          TaskModel taskModel = TaskModel(
                            title: content,
                            description: description,
                            category: category,
                            // currentColor: "${currentColor.red}${currentColor.green}${currentColor.blue}${currentColor.opacity}"
                          );
                          await Provider.of<DbProvider>(context, listen: false)
                              .createNewTask(taskModel);
                          setState(() => currentColor = pickerColor);
                          log(currentColor.toString());
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Add Task",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
