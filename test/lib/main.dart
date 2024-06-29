import 'package:flutter/material.dart';
import 'package:test/project/first_page.dart';
import 'package:test/project/login_page.dart';
import 'package:test/project/calculator.dart';
import 'package:test/project/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        theme: ThemeData(
      ),
      home: FirstPage(),
      routes: {
        '/login': (context) => LoginPage(),
         '/signup': (context) => SignupPage(),
        '/welcome': (context) => FirstPage(),
         '/calculator': (context) => CalculatorPage(),
      },
    );
  }
}