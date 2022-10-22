import 'package:kart/kart.dart';
import 'package:test/test.dart';

void main() {
  group('iterable joinToString test', () {
    test("joinToString Default", () {
      final result = [1, 2, 3, 4, 5].joinToString();
      expect(result, "1, 2, 3, 4, 5");
    });

    test("joinToString withNullable", () {
      final result = [1, 2, 3, 4, 5, null].joinToString();
      expect(result, "1, 2, 3, 4, 5, null");
    });


    test("joinToString ", () {
      final result = [1, 2, 3, 4, 5].joinToString(
        separator: ".",
        prefix: "prefix",
        postfix: "postfix",
        transform: (e) => "${e + 1}",
      );
      expect(result, "prefix2.3.4.5.6postfix");
    });

    test("joinToString truncated", () {
      final result = [1, 2, 3, 4, 5].joinToString(
        limit: 4,
        truncated: "^^^"
      );
      expect(result, "1, 2, 3, 4, ^^^");
    });
  });
}
