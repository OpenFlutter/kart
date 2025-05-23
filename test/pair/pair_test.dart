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

    test("pair equal", () {
      var pair1 = pairOf("first", 2);
      var pair2 = pairOf("first", 2);

      assert(pair1 == pair2);
    });
  });
}
