import 'dart:convert';

import 'package:arwa_quiz_f/pojo/Response.dart';
import 'package:http/http.dart' as http;

class ApiController {
  Future<List<Users>> getAllUsers() async {
    List<Users> list = [];

    Uri uri = Uri.parse("http://demo-api.mr-dev.tech/api/users");

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      body["data"].forEach((e) {
        list.add(Users.fromJson(e));
      });
    }
    return list;
  }
}
