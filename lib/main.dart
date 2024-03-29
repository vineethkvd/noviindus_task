import 'package:flutter/material.dart';
import 'package:noviindus_task/view/splash_screen.dart';
import 'package:noviindus_task/view_model/auth_view_model/login_view_model.dart';
import 'package:noviindus_task/view_model/home_view_model/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => UserViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
      ),
    ], child: MaterialApp(
      home: SplashScreen(),
    ));
  }
}
