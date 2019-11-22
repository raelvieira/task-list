import 'package:bloc/bloc.dart';

enum CreateTasksEvent { increment, decrement }

class CreateTasksBloc extends Bloc<CreateTasksEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CreateTasksEvent event) async* {
    switch (event) {
      case CreateTasksEvent.decrement:
        yield state - 1;
        break;
      case CreateTasksEvent.increment:
        yield state + 1;
        break;
    }
  }
}
