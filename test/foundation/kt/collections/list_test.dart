import 'package:kart/kart.dart';
import 'package:test/test.dart';

void main() {

  group('test firstOrNullIf', () {
    test("firstOrNullIf nameLengthIs3 ExpectJane", () {
      List<String>? names = ["Ada", "James", "Harden", "Bob", "Jane"];
      var result = names.firstOrNullIf((it) => it.length == 4);
      expect(result, "Jane");
    });

    test("firstOrNullIf nameLengthIs8 ExpectNull", () {
      List<String>? names = ["Ada", "James", "Harden", "Bob", "Jane"];
      var result = names.firstOrNullIf((it) => it.length == 9);
      expect(result, null);
    });
  });

  group('test lastOrNullIf', () {
    test("lastOrNullIf nameLengthIs3 ExpectBob", () {
      List<String>? names = ["Ada", "James", "Harden", "Bob", "Jane"];
      var result = names.lastOrNullIf((it) => it.length == 3);
      expect(result, "Bob");
    });

    test("lastOrNullIf nameLengthIs9 ExpectNull", () {
      List<String>? names = ["Ada", "James", "Harden", "Bob", "Jane"];
      var result = names.lastOrNullIf((it) => it.length == 9);
      expect(result, null);
    });
  });
}
