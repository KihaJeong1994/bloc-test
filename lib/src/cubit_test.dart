import 'package:bloc/bloc.dart';

void main(List<String> args) async {
  // final cubit = CounterCubit(0);
  // print(cubit.state);
  // final subscription = cubit.stream.listen(print);
  // await Future.delayed(Duration(seconds: 3));
  // cubit.increment();
  // await Future.delayed(Duration.zero);
  // await subscription.cancel();
  // await cubit.close();
  // // cubit.increment(); //Bad state: Cannot emit new states after calling close
  // // print(cubit.state);
  // print('---------');
  Bloc.observer = SimpleBlocObserver();
  CounterCubit(0)
    ..increment()
    ..close();
}

class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);

  void increment() {
    addError(Exception('increment error'), StackTrace.current);
    emit(state + 1);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
