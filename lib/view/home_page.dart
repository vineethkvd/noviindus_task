import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/auth_view_model/login_view_model.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
          child: Column(
        children: [],
      )),
    );
  }
}
