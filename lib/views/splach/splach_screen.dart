import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_db_provider/Router/router.dart';
import 'package:todo_db_provider/views/screens/main_screen.dart';
import 'package:todo_db_provider/views/splach/Onboarding.dart';

class SplachScreen extends StatelessWidget {
  delayedFun() async {
    await Future.delayed(const Duration(seconds: 3),
        (() => AppRouter.NavigateToWidget(onboarding())));
    // SpHelper.spHelperObject.getUser();
    AppRouter.NavigateWithReplacemtnToWidget(MainTodoPage());
  }

  @override
  Widget build(BuildContext context) {
    delayedFun();
    return const Scaffold(
      body: Center(
          child: Image(
        image: AssetImage("assets/images/logo.png"),
        height: 130,
        width: 130,
      )),
    );
  }
}
