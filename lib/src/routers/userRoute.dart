// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/users/recently_read.dart';
import '../pages/users/recommended_page.dart'; // Replace with actual pages
import '../pages/users/top_books_page.dart';
import '../pages/users/settings_page.dart';
import '../pages/users/settings/profile_edit.dart';
import "../pages/users/bookInfo/book_info.dart";

class UserRoutes {
  static final List<GoRoute> routes = [
    GoRoute(
      path: '/home',
      builder: (context, state) => const UserModulePage(),
      routes: [
        GoRoute(
          path: 'settings/edit-profile',
          builder: (context, state) => const ProfileEditPage()
        ),
        GoRoute(
          path: 'book-info',
          builder: (context, state) => const BookInfoPage(),
        ),
      ]
    ),
    // Add additional user module routes here if needed
  ];
}

class UserModulePage extends StatefulWidget {
  const UserModulePage({Key? key}) : super(key: key);

  @override
  State<UserModulePage> createState() => _UserModulePageState();
}

class _UserModulePageState extends State<UserModulePage> {
  int _currentIndex = 0; // Tracks the active tab index

  // List of widget pages corresponding to each tab
  final List<Widget> _pages = [
    const RecommendedPage(),
    const TopBooksPage(),
    const RecentlyReadPage(),
    const SettingsPage(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getPageTitle(_currentIndex)),
        backgroundColor: const Color(0xFF558B2F), // Theme color
      ),
      body: _pages[_currentIndex], // Display the selected tab's page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed, // Ensures all tabs are visible
        selectedItemColor: const Color(0xFF558B2F), // Active tab color
        unselectedItemColor: Colors.grey, // Inactive tab color
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update active tab index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Recommended",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Top Books",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Recently Read",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  // Helper to get the title for each tab
  String _getPageTitle(int index) {
    switch (index) {
      case 0:
        return 'Recommended';
      case 1:
        return 'Top Books';
      case 2:
        return 'Recently Read';
      case 3:
        return 'Settings';
      default:
        return 'User Module';
    }
  }
}
