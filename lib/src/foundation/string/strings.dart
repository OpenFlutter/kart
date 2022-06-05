extension NullableStringExtension on String? {
  bool isNullOrBlank() {
    return this?.trim().isEmpty ?? true;
  }

  String orEmpty() {
    return this ?? "";
  }
}

extension StringExtension on String {
  bool isBlank() {
    return trim().isEmpty;
  }

  bool isNotBlank() => !isBlank();
}
