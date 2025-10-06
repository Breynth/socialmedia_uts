import 'package:flutter/material.dart';
import 'screen/feed_screen.dart';
import 'screen/search_screen.dart';
import 'screen/profile_screen.dart';

void main() {
  runApp(const SocialApp());
}

class SocialApp extends StatefulWidget {
  const SocialApp({super.key});

  @override
  State<SocialApp> createState() => _SocialAppState();
}

class _SocialAppState extends State<SocialApp> {
  int _selectedIndex = 0;

  // daftar halaman yang ditampilkan
  final List<Widget> _pages = const [
    FeedScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'SocialApp',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          elevation: 2,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message_outlined),
            ),
          ],
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
