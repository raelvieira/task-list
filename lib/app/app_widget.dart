import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lista_tarefas/app/modules/home/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      title: 'Task List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.red,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.red,
          elevation: 0,
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))
          )
        )
      ),
      home: HomeModule(),
    );
  }
}
