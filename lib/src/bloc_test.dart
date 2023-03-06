import 'package:bloc/bloc.dart';

void main(List<String> args) async {
  final bloc = CounterBloc(0);
  bloc
    ..add(CounterIncrementPressed())
    ..close();
}

abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(super.initialState) {
    on<CounterIncrementPressed>((event, emit) {
      addError(Exception('increment error'), StackTrace.current);
      emit(state + 1);
    });
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
