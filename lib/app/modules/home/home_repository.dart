import 'package:dio/dio.dart';
import 'package:lista_tarefas/app/models/Tasks.dart';
import 'package:lista_tarefas/shared/custom_dio/CustomDio.dart';

class HomeRepository {
  final CustomDio _client;

  HomeRepository(this._client);

  Future<List<Tasks>> getTasks() async {
    try {
      var response = await _client.get('tasks/Tasks/findAll');
      return (response.data as List).map( (tasks) => Tasks.fromJson(tasks)).toList();
    }on DioError catch(e) {
      throw(e.message);
    }
  }
}