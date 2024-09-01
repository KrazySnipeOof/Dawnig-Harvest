import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'calculate.dart';
import 'map.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _currentIndex = 1; // Set initial index to Home
  final PageController _pageController = PageController(initialPage: 1);

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
        backgroundColor: const Color.fromARGB(255, 113, 214, 123),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        color: const Color.fromARGB(255, 113, 214, 123),
        items: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.map),
              Text('Map', style: TextStyle(fontSize: 12)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.home),
              Text('Home', style: TextStyle(fontSize: 12)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.calculate),
              Text('Calculate', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
        onTap: _onTap,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          const Map(), // Map page
          Center(
            child: Text('Home Page Content Here'),
          ), // Home page content without navigating to another Bottom widget
          const Calculate(), // Calculate page
        ],
      ),
    );
  }
}

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
      drawer: const Drawer(
        // Add your drawer content here
      ),
      body: const Bottom(), // Only reference Bottom once in the entire app structure
    );
  }
}
