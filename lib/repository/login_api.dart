import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/patient_list_model.dart';
import '../model/user_model.dart';
import 'abstract_class_ropository.dart';

class ApiService extends ClassRepository {
  @override
  Future<UserModel> loginUser(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://flutter-amr.noviindus.in/api/Login'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: <String, String>{
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      print("ok done");
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login.');
    }
  }

  @override
  Future<List<PatientListModel>> getPatients() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('No token found.');
    }

    final response = await http.get(
      Uri.parse('https://flutter-amr.noviindus.in/api/PatientList'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $token', // Use the token here
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body
          .map((dynamic item) => PatientListModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load patients.');
    }
  }
}
