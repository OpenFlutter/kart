import 'package:kart/kart.dart';
import 'package:test/test.dart';

void main() {
  group('iterable forEach test', () {
    test("forEachIndexed SourceEmpty ResultEmpty", () {
      Iterable<String> list = [];
      List<String> result = [];
      list.forEachIndexed((index, element) => result.add("$index$element"));
      expect(result, containsAll([]));
    });

    test("forEachIndexed HasSource CombinedResult", () {
      Iterable<String> list = ["James", "Morgan", "Bon"];
      List<String> result = [];
      list.forEachIndexed((index, element) => result.add("$index$element"));
      expect(result, containsAll(["0James", "1Morgan", "2Bon"]));
    });
  });
}
