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
