import 'package:github_contributions/github_contributions.dart';
import 'package:test/test.dart';

var login = 'pd4d10';

void main() {
  group('get contributions', () {
    List<ContributionsInfo> contributions;

    setUp(() async {
      contributions = await getContributions(login);
    });

    test('has data', () {
      expect(contributions.length, isNonZero);
    });

    test('field not null', () {
      contributions.forEach((info) {
        expect(info.color, isNotNull);
        expect(info.count, isNotNull);
        expect(info.date, isNotNull);
      });
    });

    test('data format', () {
      contributions.forEach((info) {
        expect(RegExp(r'#\w{6}').hasMatch(info.color), isTrue);
        expect(info.count, greaterThanOrEqualTo(0));
        expect(RegExp(r'\d{4}-\d{2}-\d{2}').hasMatch(info.date), isTrue);
      });
    });
  });
}
