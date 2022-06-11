import 'package:test/test.dart';
import 'package:kart/kart.dart';

void main() {
  group('cast test', () {
    test("cast", () {
      Iterable<String> hi = [""];
      List<String> map = hi.castTo();
      expect(map.runtimeType, List<String>);
    });

    test("safe cast", () {
      int a = 1;
      expect(a.safeCastTo<double>(), null);
    });
  });
}
