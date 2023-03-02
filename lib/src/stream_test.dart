void main(List<String> args) async {
  int max = 10;
  Stream<int> stream = countStream(max);
  int sum = await sumStream(stream);
  print(sum);
}

Stream<int> countStream(int max) async* {
  for (int i = 0; i < max; i++) {
    yield i;
  }
}

Future<int> sumStream(Stream<int> stream) async {
  int sum = 0;
  await for (int val in stream) {
    sum += val;
  }
  return sum;
}
