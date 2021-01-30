import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:markdown/markdown.dart' as md;

String getFormattedDate(int timestamp) {
  final storage = GetStorage();
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var format = DateFormat(storage.read('dateFmt') ?? 'dd.MM.yy hh:mm');
  return format.format(date);
}

void launchUrlWithToken(String url) async {
  final storage = GetStorage();
  await launch(url + '?token=${storage.read('token')}');
}

void launchUrl(String url) async => await launch(url);

String getMdFromHtml(String html) {
  return html2md.convert(html);
}

String mdToHtml(String markdown) {
  return md.markdownToHtml(markdown);
}
