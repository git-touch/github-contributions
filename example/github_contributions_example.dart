import 'package:github_contributions/github_contributions.dart';

main() async {
  var login = 'pd4d10'; // replace this with GitHub account you want

  // get color and count of this year's contribution
  var contributions = await getContributions(login);
  print(contributions[0].color);
}
