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
    for (E element in this) {
      if (predicate(element)) return element;
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
    late E result;
    bool foundMatching = false;
    for (E element in this) {
      if (predicate(element)) {
        result = element;
        foundMatching = true;
      }
    }
    if (foundMatching) return result;
    return null;
  }
}
