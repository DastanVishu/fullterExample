// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'This is the summary of the book. Here you can provide a brief description about the book’s content, author, and background.',
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}
