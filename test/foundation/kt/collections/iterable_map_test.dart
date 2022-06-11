import 'package:kart/kart.dart';
import 'package:test/test.dart';

void main() {
  group('iterable mapIndex test', () {
    test("mapIndex List Expected Correct", () {
      Iterable<int> iterables = [1, 2, 3, 4];
      var result = iterables.mapIndexed((index, element) => "$index$element");

      expect(result, ["01", "12", "23", "34"]);
    });

    test("mapIndex NotList Expected Correct", () {
      Set<int> iterables = {1, 2, 3, 4};
      var result = iterables.mapIndexed((index, element) => "$index$element");

      expect(result, ["01", "12", "23", "34"]);
    });
  });

  group('iterable mapNotNull test', () {
    test("mapNotNull containsNull Expected Correct", () {
      Iterable<int?> iterables = [1, 2, null, 3, 4, null];
      var result = iterables.mapNotNull((e) => "$e");

      expect(result, ["1", "2", "3", "4"]);
    });

    test("mapNotNull NotContainsNull Expected Correct", () {
      Iterable<int> iterables = [1, 5, 3, 4];
      var result = iterables.mapNotNull((e) => "$e");

      expect(result, ["1", "5", "3", "4"]);
    });
  });
}
