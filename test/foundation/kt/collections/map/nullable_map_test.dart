import 'package:kart/kart.dart';
import 'package:test/test.dart';

void main() {
  group('orEmpty', () {
    test(" given map is null || return empty map", () {
      Map<String,String>? map ;
      var result = map.orEmpty();

      expect(result, {});
    });

    test(" given map is null || return empty map", () {
      Map<String,String>? map = {
        "lan":"dart"
      };
      var result = map.orEmpty();

      expect(result,  {
        "lan":"dart"
      });
    });
  });
}
