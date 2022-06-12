import 'package:kart/kart.dart';
import 'package:test/test.dart';

void main() {
  group('map getOrElse test', () {
    test("map getOrElse Expected NotDefaultValue", () {
      var map = {
        "test1": 1,
        "test2": 2,
      };
      var result = map.getOrElse("test1", () => 3);

      expect(result, 1);
    });

    test("map getOrElse Expected defaultValue", () {
      var map = {
        "test1": 1,
        "test2": 2,
      };
      var result = map.getOrElse("test3", () => 3);

      expect(result, 3);
    });
  });
}
