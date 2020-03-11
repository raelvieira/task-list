import 'package:lista_tarefas/app/app_module.dart';
import 'package:lista_tarefas/app/modules/home/home_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:lista_tarefas/app/modules/home/home_page.dart';
import 'package:lista_tarefas/app/modules/home/home_repository.dart';
import 'package:lista_tarefas/shared/custom_dio/CustomDio.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
    Bloc((i) => HomeBloc(HomeModule.to.getDependency<HomeRepository>())),
  ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => HomeRepository(AppModule.to.getDependency<CustomDio>()))
  ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
