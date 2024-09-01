import 'package:flutter/material.dart';
import 'navbar.dart';
import 'bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  final String password;

  const HomeScreen({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 113, 214, 123),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text('Welcome $username!'),
      ),
      drawer: Navbar(username: username, password: password),
      body: Bottom(), // Integrate the Bottom widget here
    );
  }
}
