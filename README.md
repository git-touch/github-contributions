**DEPRECATED**: [GitHub GraphQL API](https://docs.github.com/en/graphql/overview/explorer) already provides contributions data:

```graphql
{
  viewer {
    contributionsCollection {
       # ..
    }
  }
}
```

# github_contributions

[![build](https://img.shields.io/travis/pd4d10/github-contributions.svg)](https://travis-ci.org/pd4d10/github-contributions)
[![pub](https://img.shields.io/pub/v/github_contributions.svg)](https://pub.dartlang.org/packages/github_contributions)


A library to get GitHub users' contributions information, for Dart and Flutter developers

## Usage

```dart
import 'package:github_contributions/github_contributions.dart';

main() async {
  var login = 'pd4d10'; // replace this with GitHub account you want

  // Get latest contributions
  var contributions = await getContributions(login);
  print(contributions[0].count);
  print(contributions[0].color);
  print(contributions[0].date);

  // Specify date
  var contributionsByDate = await getContributions(
    login,
    from: '2019-09-01',
    to: '2019-09-11',
  );
  print(contributionsByDate.length);
}
```

## License

MIT
