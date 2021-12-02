import 'package:flutter_test/flutter_test.dart';

import 'package:life_saver_extensions/life_saver_extensions.dart';

void main() {
  /// the tests are based on the values, don't touch!
  const fullInts = [1, 2, 3];

  group(
    'AdamFlutterIterable extension on Iterable',
    () {
      test(
        'joinList',
        () {
          final list = [];

          // [0, 2, 4, 6, 8]
          for (var i = 0; i < 10; i += 2) {
            list.add(i);
          }

          // adds [1, 3, 5, 7], so it becomes
          // [0, 1, 2, 3, 4, 5, 6, 7, 8]
          final joined = list.joinList(
            (index) => list[index] + 1,
          );

          // [0, 1, 2, 3, 4, 5, 6, 7, 8]
          final expected = List.generate(
            9,
            (index) => index,
          );

          expect(joined, expected);
        },
      );
    },
  );
  group(
    'AdamFlutterList extension on List',
    () {
      final int? r = fullInts.getElement(2), l = fullInts.getElement(5);
      test(
        'getElement()',
        () {
          expect(r, 3);
          expect(l, null);
          expect(fullInts.getElement(0) == null, false);
        },
      );
      test(
        'mapProperly()',
        () {
          expect(
            fullInts.map((e) => e).getElement(0).runtimeType == int,
            true,
          );
          expect(
            fullInts.map((e) => e + 1).getElement(0) ==
                fullInts.getElement(0)! + 1,
            true,
          );
          expect(
            fullInts
                    .where((e) => e > 1)
                    .map(
                      (e) => e + 1,
                    )
                    .getElement(0) ==
                fullInts.getElement(1)! + 1,
            true,
          );
        },
      );
    },
  );
  group(
    'AdamFlutterMap extension on Map',
    () {
      final Map<String, String> adnan = {
        'adnan': 'not adnan',
        'item1': 'val1',
        'item4': 'val4',
      };
      String? d;
      test(
        'setElement()',
        () {
          const String k = 'a';
          adnan.setElement(k, d);
          expect(
            adnan[k] == null,
            true,
          );
        },
      );
      test(
        'getElement()',
        () {
          expect(
            adnan[adnan.keys.toList().getElement(0)!] != null,
            true,
          );
          expect(adnan['adn'] == null, true);
        },
      );
      test(
        'getAnyIfContains()',
        () {
          expect(adnan.getAnyIfContains(['adnan']) != null, true);
          expect(adnan.getAnyIfContains(['adn']) == null, true);
        },
      );
    },
  );
  group(
    'AdamFlutterString extension on String',
    () {
      test(
        'cutAfter method',
        () {
          const String _r = 'adnan and 2 other people',
              _t = 'adnan',
              additionString = '-';
          expect(
            _r.cutAfter(10, additionString, 2),
            'nan and ' + additionString,
          );
          expect(
            _t.cutAfter(5, additionString, 0),
            _t,
          );
        },
      );

      test(
        'removeAt method',
        () {
          const input = 'abcde';
          expect(input.removeAt(0), 'bcde');
          expect(input.removeAt(1), 'acde');
          expect(input.removeAt(4), 'abcd');
        },
      );
    },
  );
}
