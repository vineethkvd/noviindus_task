import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/user_model.dart';
import '../../repository/login_api.dart';

class UserViewModel extends ChangeNotifier {
  late UserModel _user;
  late String _error;
  final ApiService _apiService = ApiService();

  UserModel get user => _user;
  String get error => _error;

  Future<void> login(String username, String password,BuildContext context) async {
    try {
      _user = await _apiService.loginUser(username, password);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', _user.token);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful!')),
      );
      notifyListeners();
    } catch (e) {
      _error = 'Failed to login: $e';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login fail!')),
      );
      notifyListeners();
    }
  }
}
