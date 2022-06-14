import 'package:kart/kart.dart';

class IndexedValue<T> {
  int index;
  T value;

  IndexedValue(this.index, this.value);

  @override
  String toString() {
    return "[$index]{$value}";
  }
}

extension KtIterableExtension<E> on Iterable<E> {
  Iterable<E> whereNot(bool Function(E it) test) =>
      where((it) => !test(it));

  /// returns first element or [null]
  ///
  /// if `this` is is [null] or empty returns [null].
  ///
  /// Example:
  /// ```dart
  /// var result = [].firstOrNull() // null
  /// var result = [1,2,3].firstOrNull() // 1
  E? firstOrNull() => isEmpty ? null : first;

  ///
  /// Returns the first element matching the given [predicate], or null if element was not found.
  ///
  /// Example:
  /// ```dart
  ///  {"Ada", "James", "Harden", "Bob", "Jane"}.firstOrNullIf((it) => it.length == 9); // null
  ///  {"Ada", "James", "Harden", "Bob", "Jane"}.firstOrNullIf((it) => it.length == 4); // Jane
  /// ```
  ///
  E? firstOrNullIf(bool Function(E it) predicate) {
    for (var item in this) {
      if (predicate(item)) {
        return item;
      }
    }

    return null;
  }

  /// returns last element or [null]
  ///
  /// if `this` is is [null] or empty returns [null].
  ///
  /// Example:
  /// ```dart
  /// var result = [].lastOrNull() // null
  /// var result = [1,2,3].lastOrNull() // 3
  /// ```
  E? lastOrNull() => isEmpty ? null : last;

  ///
  /// Returns the last element matching the given [predicate], or null if element was not found.
  ///
  /// Example:
  /// ```dart
  ///  {"Ada", "James", "Harden", "Bob", "Jane"}.lastOrNullIf((it) => it.length == 9); // null
  ///  {"Ada", "James", "Harden", "Bob", "Jane"}.lastOrNullIf((it) => it.length == 3); // Bob
  /// ```
  ///
  E? lastOrNullIf(bool Function(E it) predicate) {
    Iterator<E> it = iterator;
    if (!it.moveNext()) {
      return null;
    }
    E? result;
    do {
      if (predicate(it.current)) {
        result = it.current;
      }
    } while (it.moveNext());
    return result;
  }

  /// Returns the index of the last item in the list or -1 if the list is empty.
  ///
  /// Example:
  ///
  /// ```dart
  /// var result = [1,2,3].lastIndex // 2
  /// var result = [].lastIndex // -1
  ///
  int get lastIndex => length - 1;
}

extension KtNullabeIterableExtension<E> on Iterable<E>? {
  Iterable<E> orEmpty() => this ?? Iterable.empty();
}

typedef IterableFallbackElement<T> = T Function(int);

extension GetElementsForIterable<E> on Iterable<E> {
  /// Returns an element at the given index or the result of calling the [defaultValue] function if the index is out of bounds of this list.
  ///
  /// Example:
  /// ```dart
  /// Iterable<int> iterables = [1, 2, 3, 4];
  /// var result = iterables.getOrElse(6, (index) => 66); // 66
  ///
  /// Iterable<int> iterables = [1, 2, 3, 4];
  /// var result = iterables.getOrElse(1, (index) => 66); // 2
  /// ```
  E getOrElse(int index, E Function(int) defaultValue) {
    if (index >= 0 && index <= lastIndex) {
      return elementAt(index);
    } else {
      return defaultValue(index);
    }
  }

  /// Returns an element at the given index or null if the index is out of bounds of this list.
  ///
  /// Example:
  /// ```dart
  /// Iterable<int> iterables = [1, 2, 3, 4];
  /// var result = iterables.getOrNull(6); // null
  ///
  /// Iterable<int> iterables = [1, 2, 3, 4];
  /// var result = iterables.getOrNull(1); // 2
  /// ```
  ///
  E? getOrNull(int index) {
    if (index >= 0 && index <= lastIndex) {
      return elementAt(index);
    } else {
      return null;
    }
  }
}

extension MapForIterable<E> on Iterable<E> {
  ///Returns a list containing the results of applying the given transform function to each element and its index in the original collection.
  /// Params:
  /// [transform] - function that takes the index of an element and the element itself and returns the result of the transform applied to the element.
  ///
  /// Example:
  ///```dart
  ///   Iterable<int> iterables = [1, 2, 3, 4];
  ///   var result = iterables.mapIndexed((index, element) => "$index$element");  // ["01", "12", "23", "34"]
  ///
  ///   Set<int> iterables = {1, 2, 3, 4};
  ///   var result = iterables.mapIndexed((index, element) => "$index$element"); // ["01", "12", "23", "34"]
  ///   ```
  Iterable<R> mapIndexed<R>(R Function(int index, E e) transform) {
    if (this is List<E>) {
      List<E> list = this as List<E>;
      return map((e) => transform(list.indexOf(e), e));
    }
    var tempList = toList();
    return tempList.map((e) => transform(tempList.indexOf(e), e));
  }

  ///Returns a list containing only the non-null results of applying the given transform function to each element in the original collection.
  ///
  /// Example:
  ///
  /// ```dart
  /// [1, 2, null, 3, 4, null].mapNotNull((e) => e?.toString()) // ["1", "2", "3", "4"]
  ///
  /// [1, 5, 3, 4].mapNotNull((e) => "$e")  // ["1", "5", "3", "4"]
  ///```
  ///
  Iterable<R> mapNotNull<R extends Object>(R? Function(E? e) transform) {
    var resultList = <R>[];
    forEach((element) {
      final item = transform(element);
      if (item != null) {
        resultList.add(item);
      }
    });

    return resultList;
  }
}
