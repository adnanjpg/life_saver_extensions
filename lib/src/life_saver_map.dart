extension LifeSaverMap<K, V> on Map<K, V> {
  /// this guy takes a list of keys, and
  /// returns the value of the first one
  /// of them that is included in the map
  /// if no key is found, it returns null
  ///
  /// example:
  /// a = {'a': 1, 'b': 2, 'c': 3}
  ///
  /// a.getAnyOfKeys(['e','v','d','b']) => 2
  /// as it contains b
  V? getAnyOfKeys(List<K> keys) {
    V? output;
    for (K key in keys) {
      final V? d = this[key];
      if (d != null) {
        output = d;
        break;
      }
    }
    return output;
  }
}
