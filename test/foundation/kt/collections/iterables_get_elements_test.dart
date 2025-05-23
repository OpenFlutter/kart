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

  group("firstNotNullOfOrNull", () {
    test("non-null value was produced | return 1", () {
      Iterable<String> iterables = ["Ada", "John", "James", "Linda"];

      var result = iterables.firstNotNullOfOrNull(transform: (e) {
        if (e == "James") {
          return 1;
        } else {
          return null;
        }
      });

      expect(result, 1);
    });

    test("no non-null value was produced | return null", () {
      Iterable<String> iterables = ["Ada", "John", "James", "Linda"];

      int? result = iterables.firstNotNullOfOrNull(transform: (e) {
        if (e == "Arthur") {
          return null;
        } else {
          return null;
        }
      });

      expect(result, null);
    });
  });
}
