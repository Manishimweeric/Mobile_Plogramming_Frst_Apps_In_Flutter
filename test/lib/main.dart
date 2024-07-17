import 'package:flutter/material.dart';
import 'package:test/project/first_page.dart';
import 'package:test/project/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/project/calculator.dart';
import 'package:test/project/signup.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
  runApp(MyApp(isDarkMode: isDarkMode));
}

class MyApp extends StatefulWidget {
  final bool isDarkMode;

  const MyApp({super.key, required this.isDarkMode});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.isDarkMode;
  }

  void toggleTheme() async {
    setState(() {
      isDarkMode = !isDarkMode;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: FirstPage(toggleTheme: toggleTheme),
      routes: {
        '/login': (context) => LoginPage(),
        '/welcome': (context) => FirstPage(toggleTheme: toggleTheme),
        '/calculator': (context) => CalculatorPage(),
      },
    );
  }
}
