import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class ContributionsInfo {
  int count;
  String color;
  String date;
  ContributionsInfo({this.count, this.color, this.date});
}

Future<List<ContributionsInfo>> getContributions(String login) async {
  var res = await http.get('https://github.com/$login');
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

/// Get user contributions data as svg string
Future<String> getContributionsSvg(String login,
    {bool withoutText = false}) async {
  var res = await http.get('https://github.com/$login');
  var document = parse(res.body);
  var svg = document.querySelector('.js-calendar-graph-svg')?.outerHtml;
  if (svg != null && withoutText) {
    svg = svg.replaceAll(RegExp(r'<text.*?>.*?</text>'), '');
  }
  return svg;
}
