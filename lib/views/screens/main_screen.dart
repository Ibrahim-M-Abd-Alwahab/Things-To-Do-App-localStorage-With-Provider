import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_db_provider/views/screens/all_tasks_screen.dart';
import 'package:todo_db_provider/views/screens/completed_tasks_screen.dart';
import 'package:todo_db_provider/views/screens/incomplete_tasks_screen.dart';
import 'package:todo_db_provider/views/screens/new_task_screen.dart';

class MainTodoPage extends StatefulWidget {
  @override
  State<MainTodoPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainTodoPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  initTabBar() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void initState() {
    super.initState();
    initTabBar();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> widgetOptions = <Widget>[
    Center(child: AllTasksScreen()),
    Center(child: CompleteTasksScreen()),
    Center(child: InCompleteTasksScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff7646FF),
        elevation: 0,
        title: Row(
          children: const [
            Text('ThingsTOD',
                style: TextStyle(fontSize: 25, fontFamily: 'Roboto')),
            SizedBox(width: 3),
            Image(
              image: AssetImage("assets/images/logo2.png"),
              width: 25,
              height: 25,
            ),
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
      body: widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel),
            label: 'Cancelled',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff7646FF),
        onTap: _onItemTapped,
      ),
    );
  }
}
