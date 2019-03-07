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
    {bool keepDateText = false}) async {
  var res = await http.get('https://github.com/$login');
  var document = parse(res.body);
  var svgNode = document.querySelector('.js-calendar-graph-svg');

  if (!keepDateText) {
    // remove text tags
    svgNode.children[0].children.forEach((child) {
      if (child.localName == 'text') {
        child.remove();
      }
    });

    // resize
    // the size depend on if use check the 'Activity overview' option
    // TODO:
    if (svgNode.attributes['width'] == '563') {
      svgNode.attributes['width'] = '528';
      svgNode.attributes['height'] = '68';
      svgNode.children[0].attributes['transform'] = 'translate(-11, 0)';
    } else {
      svgNode.attributes['width'] = '637';
      svgNode.attributes['height'] = '84';
      svgNode.children[0].attributes['transform'] = 'translate(-13, 0)';
    }
  }

  return svgNode?.outerHtml;
}
