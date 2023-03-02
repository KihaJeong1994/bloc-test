import 'package:bloc/bloc.dart';

void main(List<String> args) {
  final cubit = CounterCubit(0);
  print(cubit.state);
  cubit.increment();
  print(cubit.state);
  cubit.close();
  // cubit.increment(); //Bad state: Cannot emit new states after calling close
  // print(cubit.state);
}

class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);
  void increment() => emit(state + 1);
}
