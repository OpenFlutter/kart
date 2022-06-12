import 'package:kart/kart.dart';
import 'package:test/test.dart';

void main() {
  group('iterable mapIndex test', () {
    test("mapIndex List Expected Correct", () {
      Iterable<_MapTestObject> iterables = [
        _MapTestObject("1"),
        _MapTestObject("2"),
        _MapTestObject("3"),
        _MapTestObject("4"),
      ];
      var result = iterables.mapIndexed((index, element) => "$index${element.identifier}");

      expect(result, ["01", "12", "23", "34"]);
    });

    test("mapIndex NotList Expected Correct", () {
      Set<_MapTestObject> iterables = {
        _MapTestObject("1"),
        _MapTestObject("2"),
        _MapTestObject("3"),
        _MapTestObject("4"),};
      var result = iterables.mapIndexed((index, element) => "$index${element.identifier}");

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

class _MapTestObject {
  final String identifier;

  _MapTestObject(this.identifier);
}
