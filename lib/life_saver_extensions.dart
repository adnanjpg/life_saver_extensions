library life_saver_extensions;

import 'package:flutter/widgets.dart';

extension AdamFlutterIterable<E> on Iterable<E> {
  /// {@macro adam_flutter.joinList}
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

  /// {@template adam_flutter.joinList}
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

  /// this guy gets prim.elementAt(index)
  /// safely, escaping index range errors.
  E? getElement(int index) {
    if (length > index) {
      return elementAt(index);
    }
    return null;
  }
}

extension AdamFlutterList<E> on List<E> {
  /// this guy refactors
  ///
  /// if the list is empty
  /// then this will return [];
  @Deprecated('just use [E.map().toList()] like a normal person')
  List<T>? mapProperly<T>(T Function(E e) f,
      {bool Function(E element)? where}) {
    if (isEmpty) return [];
    List<E>? _ = (where != null) ? this.where(where).toList() : this;
    List<T>? _res = _.map(f).toList().cast<T>();
    return _res.isNotEmpty != true ? [] : _res;
  }
}

extension AdamFlutterMap<K, V> on Map<K, V> {
  /// this method sets the value if it is not null.
  ///
  /// ```
  ///   Map _m = {};
  ///   int? d;
  ///   if (d!=null) {
  ///     _m['a'] = d;
  ///   }
  /// ```
  void setElement(K key, V? val) {
    if (val != null) this[key] = val;
  }

  /// this guy gets myMap[key] only
  /// if myMap.containsKey(key);
  ///
  /// thus we escape exceptions;
  @Deprecated('just use [] like a normal person')
  V? getElement(K key) {
    if (containsKey(key) == true) return this[key];
    return null;
  }

  /// this guy takes a list of keys, and
  /// returns the value of the one of them
  /// that is included in the map;
  V? getAnyIfContains(List<K> keys) {
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

extension AdamFlutterString on String {
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

  String removeAt(int index) {
    var stripped = this;
    // if the char's indedx is at 0, OR
    if (index == 0) {
      stripped = substring(1, length);
    }
    // is at last, just trim it.
    else if (index == length - 1) {
      stripped = substring(0, length - 1);
    }
    // substrings with excluding the desired char
    else {
      final _sub1 = substring(0, index), _sub2 = substring(index + 1, length);
      stripped = _sub1 + _sub2;
    }
    return stripped;
  }
}
