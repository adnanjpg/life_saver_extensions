import 'package:flutter_test/flutter_test.dart';

import 'package:life_saver_extensions/life_saver_extensions.dart';

void main() {
  group(
    'LifeSaverIterable',
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

      test(
        'mapWIndex',
        () {
          const elements = ['a', 'b', 'c', 'd', 'e'];

          final mapped = elements.mapWIndex(
            (index, element) => '$index$element',
          );

          expect(mapped, ['0a', '1b', '2c', '3d', '4e']);
        },
      );
    },
  );
  group(
    'LifeSaverMap',
    () {
      final Map<String, String> adnan = {
        'adnan': 'not adnan',
        'item1': 'val1',
        'item4': 'val4',
      };
      test(
        'getAnyOfKeys',
        () {
          expect(adnan.getAnyOfKeys(['adnan']), 'not adnan');
          expect(adnan.getAnyOfKeys(['adn']), null);
        },
      );
    },
  );
  group(
    'LifeSaverString',
    () {
      test(
        'cutAfter',
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
        'removeAt',
        () {
          const input = 'abcde';
          expect(input.removeAt(0), 'bcde');
          expect(input.removeAt(1), 'acde');
          expect(input.removeAt(4), 'abcd');
        },
      );
      test(
        'removeBetween',
        () {
          const input = 'abcde';
          expect(input.removeBetween(0, 4), 'e');
          expect(input.removeBetween(1, 5), 'a');
          expect(input.removeBetween(2, 3), 'abde');
          expect(() {
            input.removeBetween(0, 0);
          }, throwsA(isA<AssertionError>()));
        },
      );
    },
  );
}
