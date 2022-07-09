extension LifeSaverString on String {
  /// this cuts the string after speicified length
  ///
  /// if the string is longer than the specified length,
  /// it will cut the string and add [additionString]
  /// ( '...' by default ) at the end, else it will leave
  /// the string as it is.
  ///
  /// it treats whitespace as a character.
  ///
  /// example:
  /// 'hello world'.cutAfter(5) => 'hello...'
  /// 'hello world'.cutAfter(5, '!') => 'hello!'
  /// 'hello world'.cutAfter(11) => 'hello world'
  String cutAfter(
    int end, [
    String additionString = '...',
    int start = 0,
  ]) {
    if (end < length) {
      return substring(start, end) + additionString;
    }
    return this;
  }

  /// this cuts the characters between [startIndex] and [endIndex]
  /// from the string.
  ///
  /// [startIndex] is inclusive and [endIndex] is exclusive.
  ///
  /// example:
  /// 'hello world'.cutBetween(5, 10) => 'hello'
  ///
  /// rules:
  /// 1. [startIndex] must be less than [endIndex]
  String removeBetween(int startIndex, int endIndex) {
    assert(startIndex < endIndex);
    return substring(0, startIndex) + substring(endIndex);
  }

  /// this cuts the character at [index] from the string.
  ///
  /// example:
  /// 'hello world'.cutAt(5) => 'helloworld'
  String removeAt(int index) {
    return removeBetween(index, index + 1);
  }
}
