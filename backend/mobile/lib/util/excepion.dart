
import 'dart:math';

Exception randomException() {
  final random = Random();
  final r = random.nextInt(10);
  if (r < 3) {
    throw Exception("Unknown Exception");
  }
  return null;
}