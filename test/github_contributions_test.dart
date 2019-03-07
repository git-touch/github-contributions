import 'package:github_contributions/github_contributions.dart';
import 'package:test/test.dart';

var login = 'pd4d10';

void main() {
  group('get contributions svg', () {
    String svg;

    setUp(() async {
      svg = await getContributionsSvg(login);
    });

    test('has data', () {
      expect(svg, isNotNull);
    });

    test('is svg tag', () {
      expect(svg, startsWith('<svg'));
      expect(svg, endsWith('</svg>'));
    });
  });

  group('get contributions svg without text', () {
    String svg;

    setUp(() async {
      svg = await getContributionsSvg(login, withoutText: true);
    });

    test('has data', () {
      expect(svg, isNotNull);
    });

    test('is svg tag', () {
      expect(svg, startsWith('<svg'));
      expect(svg, endsWith('</svg>'));
    });

    test('has no text tag', () {
      expect(svg, isNot(contains('</text>')));
    });
  });
}
