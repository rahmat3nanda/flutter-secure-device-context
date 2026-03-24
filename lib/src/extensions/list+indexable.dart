extension ListExtensions<T> on Iterable<T> {
  /// Returns the first element that satisfies the given predicate [test].
  ///
  /// Returns `null` if no element satisfies [test].
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final T element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
