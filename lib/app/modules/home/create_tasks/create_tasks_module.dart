import 'package:lista_tarefas/app/modules/home/create_tasks/create_tasks_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lista_tarefas/app/modules/home/create_tasks/create_tasks_page.dart';

class CreateTasksModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => CreateTasksBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => CreateTasksPage();

  static Inject get to => Inject<CreateTasksModule>.of();
}
