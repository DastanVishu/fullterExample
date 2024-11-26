// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer';
class RecommendedPage extends StatelessWidget {
  const RecommendedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // You Liked Series Section
            _sectionTitle("You Liked Series"),
            _buildHorizontalList(),

            const SizedBox(height: 24.0),

            // Ranking Section
            _sectionTitle("Ranking"),
            _buildHorizontalList(),

            const SizedBox(height: 24.0),

            // Latest Section
            _sectionTitle("Latest"),
            _buildHorizontalList(),
          ],
        ),
      ),
    );
  }

  // Section Title Widget
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF558B2F), // Theme color
      ),
    );
  }

  // Horizontal List for each section
  Widget _buildHorizontalList() {
    return SizedBox(
      height: 245.0, // Adjust height for your list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Number of items in each section
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.go("/home/book-info");
            },
            child: _buildCard(),
          );
        },
      ),
    );
  }

  // Card widget for each item
  Widget _buildCard() {
    return Card(
      margin: const EdgeInsets.only(right: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4.0,
      child: Container(
        width: 150.0, // Card width
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              height: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage("assets/book_cover.jpeg"), // Placeholder
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            // Title and Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Book Title",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Short description or author name",
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      )
    );


  }
}
