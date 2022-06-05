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

  E? firstOrNull() => isEmpty ? null : first;

  E? lastOrNull() => isEmpty ? null : last;
}

extension KtNullabeIterableExtension<E> on Iterable<E>? {
  Iterable<E> orEmpty() => this ?? Iterable.empty();

  E? firstOrNull() =>
      (this == null || this?.isEmpty == true) ? null : this?.first;

  E? lastOrNull() =>
      (this == null || this?.isEmpty == true) ? null : this?.last;
}
