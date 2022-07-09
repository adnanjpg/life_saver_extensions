import 'package:flutter/widgets.dart';

extension LifeSaverIterable<E> on Iterable<E> {
  /// {@macro life_saver_extensions.joinList}
  ///
  /// this method is used seperate from joinList due to inheritance
  /// incompatibility
  List<Widget> joinWidgetList(Widget Function(int index) element) {
    assert(
      every(
        (element) {
          return element is Widget?;
        },
      ),
    );

    List<Widget> ls = () {
      final ls = <Widget>[];
      for (int i = 0; i < length; i++) {
        final element = elementAt(i);
        if (element != null && element is Widget) ls.add(element);
      }
      return ls;
    }();

    final List<Widget> output = [];

    for (var i = 0; i < ls.length; i++) {
      final el = ls.elementAt(i);

      output.add(el);

      // if not last element
      if (i != length - 1) {
        output.add(element(i));
      }
    }

    return output;
  }

  /// {@template life_saver_extensions.joinList}
  /// this method works similar to join method
  /// which combines strings, but this one works
  /// for all types.
  ///
  /// it is useful for putting
  /// divider between widgets.
  ///
  /// the element paremeter will pass you
  /// the index of the current element
  /// {@endtemplate}
  List<E> joinList(E Function(int index) element) {
    final List<E> output = [];

    final nonNullLength = where((element) => element != null).length;

    _getElement(int index) =>
        where((element) => element != null).elementAt(index);

    for (var i = 0; i < nonNullLength; i++) {
      final el = _getElement(i);

      output.add(el);

      // if not last element
      if (i != length - 1) {
        output.add(element(i));
      }
    }

    return output;
  }
}
