import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:haircut/pages/pagehome.dart';
import 'package:haircut/pages/profile.dart';
import 'package:haircut/pages/searchpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedindex = 0;
  void _indexset(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  List<Widget> pages = [
    const Pagehome(),
    const Searchpage(),
    const Profilepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        curve: Curves.bounceIn,
        activeColor: Colors.white,
        color: Colors.white,
        backgroundColor: Colors.black,
        onTabChange: (value) {
          _indexset(value);
        },
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search,
            text: 'search',
          ),
          GButton(
            icon: Icons.person,
            text: 'profile',
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text(
          "Netflix",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: pages[selectedindex],
    );
  }
}
