import 'Task.dart';

class Tasks {
  int id;
  String descricao;
  List<Task> tasks;

  Tasks({
    this.id,
    this.descricao,
    this.tasks
  });

  factory Tasks.fromJson(Map<String, dynamic> json) {
      return Tasks(
        id: json['id'],
        descricao: json['descricao'],
        tasks: json['tasks'].map( (task) => Task() ).toList()
      );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'descricao': descricao,
    'tasks': tasks.map( (task) => task.toJson() ).toList()
  };
}