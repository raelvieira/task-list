import 'package:bloc/bloc.dart';

enum ListTaskEvent { increment, decrement }

class ListTaskBloc extends Bloc<ListTaskEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(ListTaskEvent event) async* {
    switch (event) {
      case ListTaskEvent.decrement:
        yield state - 1;
        break;
      case ListTaskEvent.increment:
        yield state + 1;
        break;
    }
  }
}
