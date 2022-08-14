import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_db_provider/Router/router.dart';
import 'package:todo_db_provider/data/db_helper.dart';
import 'package:todo_db_provider/providers/db_provider.dart';
import 'package:todo_db_provider/views/screens/main_screen.dart';
import 'package:todo_db_provider/views/screens/new_task_screen.dart';
import 'package:todo_db_provider/views/splach/Onboarding.dart';
import 'package:todo_db_provider/views/splach/splach_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DbProvider>(
          create: (context) {
            return DbProvider();
          },
        ),
      ],
      child: MaterialApp(
        navigatorKey: AppRouter.navKey,
        debugShowCheckedModeBanner: false,
        title: 'ThingsTOD',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplachScreen(),
      ),
    );
  }
}
