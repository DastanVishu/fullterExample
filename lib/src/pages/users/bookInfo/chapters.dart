// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'chapter_reader.dart';

class ChaptersPage extends StatelessWidget {
  final List<String> chapters = [
    "Chapter 1: The Beginning",
    "Chapter 2: A New Journey",
    "Chapter 3: The First Encounter",
    "Chapter 4: Unveiling Secrets",
    "Chapter 5: The Final Showdown",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chapters.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            chapters[index],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            // Navigate to Chapter Reader
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChapterReaderPage(
                  chapterTitle: chapters[index],
                  currentChapterIndex: 0,
                  allChapters: ["Chapter 1", "Chapter 2", "Chapter 3"],
                  chapterImages: [
                    "assets/banner.jpeg",
                    "assets/banner.jpeg",
                    "assets/banner.jpeg",
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
