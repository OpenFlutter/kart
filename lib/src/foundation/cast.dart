extension CastExtension<T> on T {
  R castTo<R>() {
    return this as R;
  }

  R? safeCastTo<R>() {
    if (this is R) {
      return this as R;
    } else {
      return null;
    }
  }
}
