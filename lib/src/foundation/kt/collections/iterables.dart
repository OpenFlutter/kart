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
  Iterable<E> whereNot(bool Function(E element) test) =>
      where((element) => !test(element));

  /// returns first element or [null]
  ///
  /// if `this` is is [null] or empty returns [null].
  ///
  /// Example:
  /// ```dart
  /// var result = [].firstOrNull() // null
  /// var result = [1,2,3].firstOrNull() // 1
  E? firstOrNull() => isEmpty ? null : first;

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

  /// returns first element or [null]
  ///
  /// if `this` is is [null] or empty returns [null].
  ///
  /// Example:
  /// ```dart
  /// var result = [].firstOrNull() // null
  /// var result = [1,2,3].firstOrNull() // 1
  E? firstOrNull() =>
      (this == null || this?.isEmpty == true) ? null : this?.first;

  /// returns last element or [null]
  ///
  /// if `this` is is [null] or empty returns [null].
  ///
  /// Example:
  /// ```dart
  /// var result = [].lastOrNull() // null
  /// var result = [1,2,3].lastOrNull() // 3
  /// ```
  E? lastOrNull() =>
      (this == null || this?.isEmpty == true) ? null : this?.last;
}

typedef IterableFallbackElement<T> = T Function(int);

extension GetElementsForIterable<E> on Iterable<E> {
  /// Returns an element at the given index or the result of calling the defaultValue function if the index is out of bounds of this list.
  ///
  /// Example:
  /// ```dart
  /// Iterable<int> iterables = [1, 2, 3, 4];
  /// var result = iterables.getOrElse(6, (index) => 66); // 66
  ///
  /// Iterable<int> iterables = [1, 2, 3, 4];
  /// var result = iterables.getOrElse(1, (index) => 66); // 2
  /// ```
  E getOrElse(int index, IterableFallbackElement defaultValue) {
    if (index >= 0 && index <= lastIndex) {
      return elementAt(index);
    } else {
      return defaultValue(index);
    }
  }

  /// Returns an element at the given index or null if the index is out of bounds of this list.
  ///
  /// Example:
  /// Iterable<int> iterables = [1, 2, 3, 4];
  /// var result = iterables.getOrNull(6); // null
  ///
  /// Iterable<int> iterables = [1, 2, 3, 4];
  /// var result = iterables.getOrNull(1); // 2
  ///
  E? getOrNull(int index) {
    if (index >= 0 && index <= lastIndex) {
      return elementAt(index);
    } else {
      return null;
    }
  }
}
