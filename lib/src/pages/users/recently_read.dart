import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecentlyReadPage extends StatefulWidget {
  const RecentlyReadPage({Key? key}) : super(key: key);

  @override
  State<RecentlyReadPage> createState() => _RecentlyReadPageState();
}

class _RecentlyReadPageState extends State<RecentlyReadPage> {
  final List<Map<String, dynamic>> recentlyReadBooks = [
    {
      'title': 'Book A',
      'cover': 'assets/book_cover.jpeg',
      'lastRead': '2024-11-20',
      'chaptersCompleted': 5,
      'totalChapters': 20,
      'genres': ['Fantasy', 'Adventure'],
      'rating': 4.5,
      'readerCount': 2500,
    },
    {
      'title': 'Book B',
      'cover': 'assets/book_cover.jpeg',
      'lastRead': '2024-11-18',
      'chaptersCompleted': 18,
      'totalChapters': 20,
      'genres': ['Romance', 'Drama'],
      'rating': 4.8,
      'readerCount': 4200,
    },
    {
      'title': 'Book C',
      'cover': 'assets/book_cover.jpeg',
      'lastRead': '2024-11-15',
      'chaptersCompleted': 10,
      'totalChapters': 15,
      'genres': ['Mystery', 'Thriller'],
      'rating': 4.2,
      'readerCount': 1800,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search recently read books...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Recently Read Books List
          Expanded(
            child: ListView.separated(
              itemCount: recentlyReadBooks.length,
              padding: const EdgeInsets.all(8.0),
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final book = recentlyReadBooks[index];
                return ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SizedBox(
                        width: 70,
                        height: 160,
                        child: Image.asset(
                          book['cover'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  title: Text(
                    book['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Read: ${book['lastRead']}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Chapters: ${book['chaptersCompleted']} of ${book['totalChapters']} completed',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        book['genres'].join(', '),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16.0,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${book['rating']}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.people,
                            color: Colors.grey,
                            size: 16.0,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${book['readerCount']} readers',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    // Navigate to the book details page or resume reading page
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         BookDetailsPage(title: book['title']),
                    //   ),
                    // );
                    context.go("/home/book-info");
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BookDetailsPage extends StatelessWidget {
  final String title;

  const BookDetailsPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF558B2F), // Theme color
      ),
      body: Center(
        child: Text(
          'Details for $title',
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
