// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Card
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                context.go('/home/settings/edit-profile');
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                height: 120.0, // Increased card height
                decoration: BoxDecoration(
                  color: const Color(0xFF8BC34A), // Theme-based color
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    // Profile Icon
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Color(0xFF558B2F)), // Icon color
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Text(
                            "username123", // Replace with actual data
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Full Name", // Replace with actual data
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            "email@example.com", // Replace with actual data
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Edit Icon
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        context.go('/home/settings/edit-profile');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Options List
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Options",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFF558B2F)), // Theme-based icon color
            title: const Text("Logout"),
            onTap: () {
              // Add logout functionality here
              context.go('/login');
            },
          ),
        ],
      ),
    );
  }
}
