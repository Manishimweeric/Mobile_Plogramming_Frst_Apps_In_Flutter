import 'package:flutter/material.dart';
import 'package:test/components/app_drawer.dart';

class FirstPage extends StatelessWidget {
  final VoidCallback toggleTheme;

  FirstPage({Key? key, required this.toggleTheme}) : super(key: key);

  void navigateToLogin(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Eric Online App'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();  // Open the global drawer
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: toggleTheme,
          ),
        ],
      ),
      drawer: AppDrawer(),  // Call the global drawer here
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/images/welcome_img.png',  // Update with an appropriate image
                  width: 300,
                  height: 350,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30),
                Text(
                  'Welcome to EricShop!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Experience the best online shopping platform. Discover a wide range of products at amazing prices.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => navigateToLogin(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 12, 7, 56),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text('Shopping Leaning'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
