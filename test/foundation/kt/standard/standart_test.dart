import 'package:test/test.dart';
import 'package:kart/kart.dart';

void main() {
  group('Standard test', () {
    test("also", () {
      String? test;
      var result = test?.also((p0) => "r");
      expect(result, null);
      test = "test";
      var result2 = test.also((p0) => "r");
      expect(result2, "r");
    });

    test("takeIf", () {
      String test = "takIf";

      var result = test.takeIf((self) => self == "takIf");
      expect(result, "takIf");

      var result2 = test.takeIf((p0) => p0 == "takeIf2");
      expect(result2, null);
    });

    test("takeUnless PredicateTrue ExpectString", () {
      String test = "James";

      var result = test.takeUnless((self) => self == "Tom");
      expect(result, "James");
    });

    test("takeUnless PredicateFalse ExpectNull", () {
      String test = "James";
      var result = test.takeUnless((self) => self == "James");
      expect(result, null);
    });

    test("repeat", () {
      var finalIndex = -1;
      repeat(10, (index) => finalIndex = index);
      expect(finalIndex, 9);
    });

    test("let with?Operator Expect null", () {
      String? str;
      var result = str?.let((self) {
        return self.isNotEmpty;
      });
      expect(result, null);
    });

    test("let without?Operator Expect 1", () {
      String? str;
      var result = str.let((self) {
        return 111;
      });
      expect(result, 111);
    });

    test("let notNull", () {
      String? str = "mapped";
      var result = str.let((self) {
        return self.isNotEmpty;
      });
      expect(result, true);
    });
  });
}
