import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lista_tarefas/app/models/Tasks.dart';
import 'package:lista_tarefas/app/modules/home/home_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  final HomeRepository _repository;
  BehaviorSubject<List<Tasks>> _tasksController = BehaviorSubject<List<Tasks>>();

  HomeBloc(this._repository);

  Stream<List<Tasks>> get outTasks => _tasksController.stream;

  void getTasks() async {
    try {
      var resposta = await _repository.getTasks();
      _tasksController.add(resposta);
    }catch(e) {
      _tasksController.addError(e);
    }
  }

  @override
  void dispose() {
    _tasksController.close();
  }
}
