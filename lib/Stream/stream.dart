
/*
// Stream in flutter
Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}
/*
We can consume the above Stream in several ways.
If we wanted to write a function to return the sum of a Stream of integers it could look
something like:
 */
Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (final value in stream) {
    // print(value);
    sum += value;
  }
  return sum;
}
// End of stream code
*/

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  try {
    await for (final value in stream) {
      print(value);
      sum += value;
    }
  } catch (e) {
    print("Exception occurred");
    return -1;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i == 4) {
      throw Exception('Intentional exception');
    } else {
      yield i;
    }
  }
}

void main()async {
  // /*
  // stream in flutter
  var stream = countStream(11);
  var sum = await sumStream(stream);
  print(sum); // 55
  // end of stream
  // */
}