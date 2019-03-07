import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

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
