import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sp1_appli/fees/models/employee.dart';

Future<Employee> fetchProfile() async {
  final response = await http.get(
    Uri.parse('http://172.21.5.12:8000/api/login'),
  );

  if (response.statusCode == 200) {
    return Employee.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('An error has occured: ${response.statusCode}');
  }
}
