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
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                final viewModel =
                Provider.of<UserViewModel>(context, listen: false);
                viewModel.login(_usernameController.text,
                    _passwordController.text, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
