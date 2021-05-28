import 'dart:convert';

import 'package:sp1_appli/fees/models/login.dart';
import 'package:http/http.dart' as http;

Future<String> fetchLogin(String login, String password) async {
  //TODO: When server is offline, the app will try to connect for ever
  final response = await http.post(
      Uri.parse('http://172.21.5.12:8000/api/login'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{'email': login, 'password': password}));
  print(response.body);
  if (response.statusCode == 200) {
    return Login.fromJson(jsonDecode(response.body)).token;
  } else {
    return null;
  }
}
