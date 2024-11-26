import 'package:flutter/material.dart';

class ChapterReaderPage extends StatefulWidget {
  final String chapterTitle;
  final int currentChapterIndex; // Current chapter index for navigation
  final List<String> allChapters; // List of all chapters
  final List<String> chapterImages; // List of all chapters

  const ChapterReaderPage({
    Key? key,
    required this.chapterTitle,
    required this.currentChapterIndex,
    required this.allChapters,
    required this.chapterImages,
  }) : super(key: key);

  @override
  State<ChapterReaderPage> createState() => _ChapterReaderPageState();
}

class _ChapterReaderPageState extends State<ChapterReaderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.chapterTitle),
        backgroundColor: const Color(0xFF558B2F), // Theme color
      ),
      body: Stack(
        children: [
          PageView.builder(
            itemCount: widget.chapterImages.length,
            itemBuilder: (context, index) {
              return InteractiveViewer(
                // Allows users to zoom in/out on the image
                child: Image.asset(
                  widget.chapterImages[index],
                  fit: BoxFit.contain, // Ensures no part of the image is cut off
                  width: double.infinity,
                  height: double.infinity,
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: widget.currentChapterIndex > 0
                ? ElevatedButton(
                    onPressed: () {
                      _navigateToChapter(widget.currentChapterIndex - 1);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF558B2F),
                    ),
                    child: const Text("Previous Chapter"),
                  )
                : const SizedBox.shrink(),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: widget.currentChapterIndex < widget.allChapters.length - 1
                ? ElevatedButton(
                    onPressed: () {
                      _navigateToChapter(widget.currentChapterIndex + 1);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF558B2F),
                    ),
                    child: const Text("Next Chapter"),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  void _navigateToChapter(int chapterIndex) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ChapterReaderPage(
          chapterTitle: widget.allChapters[chapterIndex],
          currentChapterIndex: chapterIndex,
          allChapters: widget.allChapters,
          chapterImages: [
                    "assets/banner.jpeg",
                    "assets/banner.jpeg",
                    "assets/banner.jpeg",
                  ],
        ),
      ),
    );
  }
}
