class Task {
  int id;
  String descricao;
  bool completed;

  Map<String, dynamic> toJson() => {
    'id': id,
    'descricao': descricao,
    'completed': completed
  };
}