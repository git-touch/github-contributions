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
