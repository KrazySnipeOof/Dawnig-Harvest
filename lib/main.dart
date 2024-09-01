import 'package:flutter/material.dart';
import 'splash.dart';
import 'calculate.dart';
import 'home_screen.dart';
import 'login.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Splash(),
      routes: {
        '/calculate': (context) => const Calculate(),
        '/login': (context) => const Login(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final args = settings.arguments as Map<String, String>?;
          if (args != null &&
              args['username'] != null &&
              args['email'] != null) {
            return MaterialPageRoute(
              builder: (context) => HomeScreen(
                username: args['username']!,
                email: args['email']!, // Fixed argument name
              ),
            );
          } else {
            return MaterialPageRoute(
              builder: (context) =>
                  const Login(), // Redirect to Login if args are missing
            );
          }
        } else if (settings.name == '/profile') {
          final args = settings.arguments as Map<String, String>?;
          if (args != null &&
              args['username'] != null &&
              args['email'] != null) {
            return MaterialPageRoute(
              builder: (context) => Profile(
                username: args['username']!,
                email: args['email']!,
              ),
            );
          } else {
            return MaterialPageRoute(
              builder: (context) =>
                  const Login(), // Redirect to Login if args are missing
            );
          }
        }
        return null;
      },
    );
  }
}
