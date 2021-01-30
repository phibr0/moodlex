import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../data/classes.dart';

class MoodleServices {
  static var client = http.Client();

  final String token;
  final String root;

  MoodleServices({this.token, this.root});

  static Future<UserData> fetchUserData(String token, String root,
      {String fmt = 'json'}) async {
    http.Response response = await http.get(
        '$root/webservice/rest/server.php?wstoken=$token&wsfunction=mod_assign_get_assignments&moodlewsrestformat=$fmt');
    if (response.statusCode == 200) {
      return UserData.fromMap(jsonDecode(response.body));
    } else {
      Get.showSnackbar(
          GetBar(title: 'Error, server didn\'t response with 200 OK'));
      return null;
    }
  }
}

Future<String> getToken(String user, String password, String root) async {
  var resp = await http.get(
      '$root/login/token.php?username=$user&password=$password&service=moodle_mobile_app');

  if (jsonDecode(resp.body)['errorcode'] != null) {
    return null;
  } else
    return jsonDecode(resp.body)['token'].toString();
}
