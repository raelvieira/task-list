import 'package:bloc/bloc.dart';

enum AppEvent { increment, decrement }

class AppBloc extends Bloc<AppEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(AppEvent event) async* {
    switch (event) {
      case AppEvent.decrement:
        yield state - 1;
        break;
      case AppEvent.increment:
        yield state + 1;
        break;
    }
  }
}
