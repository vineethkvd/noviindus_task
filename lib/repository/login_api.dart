import 'dart:convert';
import 'package:http/http.dart' as http;
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
}
