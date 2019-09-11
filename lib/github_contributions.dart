/// A library to get GitHub users' contributions information, for Dart and Flutter developers
library github_contributions;

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class ContributionsInfo {
  int count;
  String color;
  String date;
  ContributionsInfo({this.count, this.color, this.date});
}

Future<List<ContributionsInfo>> getContributions(String login,
    {String from, String to}) async {
  var uri = Uri.https('github.com', '/users/$login/contributions', {
    ...(from == null ? {} : {'from': from}),
    ...(to == null ? {} : {'to': to}),
  });

  var res = await http.get(uri);
  var document = parse(res.body);
  var rectNodes =
      document.querySelector('.js-calendar-graph-svg').querySelectorAll('rect');
  return rectNodes.map((rectNode) {
    return ContributionsInfo(
      color: rectNode.attributes['fill'],
      count: int.tryParse(rectNode.attributes['data-count']),
      date: rectNode.attributes['data-date'],
    );
  }).toList();
}
