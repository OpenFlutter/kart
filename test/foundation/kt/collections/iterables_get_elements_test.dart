import 'package:kart/kart.dart';
import 'package:test/test.dart';

void main() {
  group('iterable get elements test', () {
    test("getOrElse Expected DefaultValue", () {
      Iterable<int> iterables = [1, 2, 3, 4];
      var result = iterables.getOrElse(6, (index) => 66);
      expect(result, 66);
    });

    test("getOrElse Expected CorrectValue", () {
      Iterable<int> iterables = [1, 2, 3, 4];
      var result = iterables.getOrElse(1, (index) => 66);
      expect(result, 2);
    });

    test("getOrNull Expected null", () {
      Iterable<int> iterables = [1, 2, 3, 4];
      var result = iterables.getOrNull(6);
      expect(result, null);
    });

    test("getOrNull Expected CorrectValue", () {
      Iterable<int> iterables = [1, 2, 3, 4];
      var result = iterables.getOrNull(1);
      expect(result, 2);
    });
  });
}
