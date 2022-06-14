extension ElementsOnList<E> on List<E> {
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
    int length = this.length;
    for (int i = 0; i < length; i++) {
      E element = this[i];
      if (predicate(element)) return element;
      if (length != this.length) {
        throw ConcurrentModificationError(this);
      }
    }
    return null;
  }

  ///
  /// Returns the last element matching the given [predicate], or null if element was not found.
  ///
  /// Example:
  /// ```dart
  ///  ["Ada", "James", "Harden", "Bob", "Jane"].lastOrNullIf((it) => it.length == 9); // null
  ///  ["Ada", "James", "Harden", "Bob", "Jane"].lastOrNullIf((it) => it.length == 3); // Bob
  /// ```
  ///
  E? lastOrNullIf(bool Function(E it) predicate) {
    int length = this.length;
    for (int i = length - 1; i >= 0; i--) {
      E element = this[i];
      if (predicate(element)) return element;
      if (length != this.length) {
        throw ConcurrentModificationError(this);
      }
    }
    return null;
  }
}
