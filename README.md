# github_contributions

## Usage

```dart
main() async {
  var login = 'pd4d10'; // replace this with GitHub account you want

  // get svg string
  String svg = await getContributionsSvg(login, withoutText: true);
  print(svg);

  // get color and count of this year's contribution
  var contributions = await getContributions(login);
  print(contributions[0].color);
}

```

## License

MIT
