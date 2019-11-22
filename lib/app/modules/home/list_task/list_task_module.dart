import 'package:lista_tarefas/app/modules/home/list_task/list_task_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lista_tarefas/app/modules/home/list_task/list_task_page.dart';

class ListTaskModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ListTaskBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ListTaskPage();

  static Inject get to => Inject<ListTaskModule>.of();
}
