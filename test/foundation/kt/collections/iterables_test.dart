import 'package:kart/kart.dart';
import 'package:test/test.dart';

void main() {
  group('iterables test', () {
    test("iterables orEmpty not empty", () {
      List<String> list = ["test"];
      expect(list.orEmpty().isEmpty, false);
    });

    test("iterables orEmpty empty", () {
      List<String>? list;
      expect(list.orEmpty().isEmpty, true);
    });
  });

  group('no-nullable test firstOrNull', () {
    test("first not null", () {
      Iterable<String> list = ["test", "test1"];
      expect(list.firstOrNull(), "test");
    });

    test("first null", () {
      Iterable<String> list = [];
      expect(list.firstOrNull(), null);
    });
  });

  group('no-nullable iterables test lastOrNull', () {
    test("last not null", () {
      Iterable<String> list = ["test", "test1"];
      expect(list.lastOrNull(), "test1");
    });

    test("last null", () {
      Iterable<String> list = [];
      expect(list.lastOrNull(), null);
    });
  });

  group('nullable test firstOrNull', () {
    test("not empty nullable-iterable expect first element not null", () {
      Iterable<String>? list = ["test", "test1"];
      expect(list.firstOrNull(), "test");
    });

    test("empty nullable-iterable expect first element null", () {
      Iterable<String>? list = [];
      expect(list.firstOrNull(), null);
    });
  });

  group('nullable test lastOrNull', () {
    test("not empty null-iterable expect last element not null", () {
      Iterable<String>? list = ["test", "test1"];
      expect(list.lastOrNull(), "test1");
    });

    test("empty nullable-iterable expect last element null", () {
      Iterable<String>? list = [];
      expect(list.lastOrNull(), null);
    });
  });

  group('test firstOrNullIf', () {
    test("firstOrNullIf nameLengthIs3 ExpectJane", () {
      Iterable<String>? names = {"Ada", "James", "Harden", "Bob", "Jane"};
      var result = names.firstOrNullIf((it) => it.length == 4);
      expect(result, "Jane");
    });

    test("firstOrNullIf nameLengthIs8 ExpectNull", () {
      Iterable<String>? names = {"Ada", "James", "Harden", "Bob", "Jane"};
      var result = names.firstOrNullIf((it) => it.length == 9);
      expect(result, null);
    });
  });

  group('test lastOrNullIf', () {
    test("lastOrNullIf nameLengthIs3 ExpectBob", () {
      Iterable<String>? names = {"Ada", "Jame", "Harden", "Bob", "Jane"};
      var result = names.lastOrNullIf((it) => it.length == 3);
      expect(result, "Bob");
    });

    test("lastOrNullIf nameLengthIs9 ExpectNull", () {
      Iterable<String>? names = {"Ada", "Jame", "Harden", "Bob", "Jane"};
      var result = names.lastOrNullIf((it) => it.length == 9);
      expect(result, null);
    });
  });

  group('iterable lastIndex test', () {
    test("lastIndex is Correct", () {
      Iterable<String> list = ["test", "abc", "dart"];
      var result = list.lastIndex;
      expect(result, 2);
    });

    test("lastIndex is -1", () {
      Iterable<String> list = [];
      var result = list.lastIndex;
      expect(result, -1);
    });
  });
}
