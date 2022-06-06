extension CastExtension<T> on T {
  R castTo<R>() {
    return this as R;
  }

  ///cast object to R.
  ///returns R if it is R, otherwise null.
  R? safeCastTo<R>() {
    if (this is R) {
      return this as R;
    } else {
      return null;
    }
  }
}
