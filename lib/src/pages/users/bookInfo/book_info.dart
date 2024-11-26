// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'summary.dart';
import 'chapters.dart';
import 'comments.dart';
class BookInfoPage extends StatelessWidget {
  const BookInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        body: Column(
          children: [
            // Custom AppBar
            Stack(
              children: [
                // Background Banner Image
                Container(
                  height: 250, // Adjust height as needed
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/banner.jpeg'), // Replace with your image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Back Button
                Positioned(
                  top: 40, // Adjust for status bar
                  left: 16,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous page
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                      shadows: [
                        Shadow(
                          blurRadius: 4.0,
                          color: Colors.black54,
                          offset: Offset(1.5, 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
                // Overlay content
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Book Cover
                      Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.white,
                            width: 3.0
                          ),
                          image: const DecorationImage(
                            image: AssetImage('assets/book_cover.jpeg'), // Replace with your image asset
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Book Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Book Name with Shadow
                            Text(
                              'Book Name Here',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 4.0,
                                    color: Colors.black54,
                                    offset: Offset(1.5, 1.5),
                                  ),
                                ],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            // Ratings
                            Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                  size: 20,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // My Rating
                            Row(
                              children: [
                                const Text(
                                  'My Rating:',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 3.0,
                                        color: Colors.black54,
                                        offset: Offset(1.0, 1.0),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    '4.5',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Marked Reading
                      IconButton(
                        onPressed: () {
                          // Handle marking/unmarking logic
                        },
                        icon: const Icon(
                          Icons.bookmark,
                          color: Colors.white,
                          size: 30,
                          shadows: [
                            Shadow(
                              blurRadius: 4.0,
                              color: Colors.black54,
                              offset: Offset(1.5, 1.5),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Tabs and TabBarView
            Expanded(
              child: Column(
                children: [
                  const TabBar(
                    indicatorColor: Color(0xFF558B2F),
                    labelColor: Color(0xFF558B2F),
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Summary'),
                      Tab(text: 'Chapters'),
                      Tab(text: 'Comments'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SummaryPage(),
                        ChaptersPage(),
                        CommentsPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
