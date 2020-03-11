import 'package:lista_tarefas/app/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lista_tarefas/app/app_widget.dart';
import 'package:lista_tarefas/shared/custom_dio/CustomDio.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
    Bloc((i) => AppBloc()),
  ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => CustomDio())
  ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
