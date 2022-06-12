extension KtMapGetExtension<K, V> on Map<K, V> {

  ///Returns the value for the given key, or the result of the [defaultValue] function if there was no entry for the given key.
  V getOrElse(K key, V Function() defaultValue) {
    return this[key] ?? defaultValue();
  }
}

extension KtNullableMapExtension<K, V> on Map<K, V> {}
