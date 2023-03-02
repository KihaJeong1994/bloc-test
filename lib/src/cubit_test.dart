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

  void increment() => emit(state + 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
