# github_contributions

## Usage

```dart
import 'package:github_contributions/github_contributions.dart';

main() async {
  var login = 'pd4d10'; // replace this with GitHub account you want
  String svg = await getContributionsSvg(login, withoutText: true);
  print(svg);
}
```

## License

MIT
