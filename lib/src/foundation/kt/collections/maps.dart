extension KtMapGetExtension<K, V> on Map<K, V> {

  ///Returns the value for the given key, or the result of the [defaultValue] function if there was no entry for the given key.
  ///
  /// Example:
  ///       var map = {
  ///         "test1": 1,
  ///         "test2": 2,
  ///       };
  ///       var result = map.getOrElse("test3", () => 3); // 3
  ///
  ///       var map = {
  ///         "test1": 1,
  ///         "test2": 2,
  ///       };
  ///       var result = map.getOrElse("test1", () => 3); // 1
  V getOrElse(K key, V Function() defaultValue) {
    return this[key] ?? defaultValue();
  }
}

extension KtNullableMapExtension<K, V> on Map<K, V> {}
