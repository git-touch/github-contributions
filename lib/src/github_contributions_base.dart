import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class ContributionsInfo {
  int count;
  String color;
  String date;
  ContributionsInfo({this.count, this.color, this.date});
}

Future<List<ContributionsInfo>> getContributions(String login) async {
  var res = await http.get('https://github.com/users/$login/contributions');
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
