import 'package:kart/kart.dart';
import 'package:test/test.dart';

void main() {
  group('pair test', () {
    test("pair element check", () {
      var first = "first";
      var second = 1;
      var result = pairOf(first, second);
      expect("first", result.first);
      expect(1, result.second);
    });
  });
}
