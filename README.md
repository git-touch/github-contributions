# github_contributions

[![build](https://img.shields.io/travis/pd4d10/github-contributions.svg)](https://travis-ci.org/pd4d10/github-contributions)
[![pub](https://img.shields.io/pub/v/github_contributions.svg)](https://pub.dartlang.org/packages/github_contributions)

A library to get GitHub users' contributions information, for Dart and Flutter developers

## Usage

```dart
import 'package:github_contributions/github_contributions.dart';

main() async {
  var login = 'pd4d10'; // replace this with GitHub account you want

  // get color and count of this year's contribution
  var contributions = await getContributions(login);
  print(contributions[0].color);
}
```

## License

MIT
