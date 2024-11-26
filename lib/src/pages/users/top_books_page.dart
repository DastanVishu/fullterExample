import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBooksPage extends StatefulWidget {
  const TopBooksPage({Key? key}) : super(key: key);

  @override
  State<TopBooksPage> createState() => _TopBooksPageState();
}

class _TopBooksPageState extends State<TopBooksPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> topRankingBooks = [
    {
      'title': 'Book A',
      'cover': 'assets/book_cover.jpeg',
      'rating': 4.8,
      'readers': '1.2M',
      'genres': ['Fantasy', 'Adventure']
    },
    {
      'title': 'Book B',
      'cover': 'assets/book_cover.jpeg',
      'rating': 4.5,
      'readers': '900K',
      'genres': ['Romance', 'Drama']
    },
    {
      'title': 'Book C',
      'cover': 'assets/book_cover.jpeg',
      'rating': 4.9,
      'readers': '2.1M',
      'genres': ['Mystery', 'Thriller']
    },
  ];

  final List<Map<String, dynamic>> topPopularBooks = [
    {
      'title': 'Book X',
      'cover': 'assets/book_cover.jpeg',
      'rating': 4.7,
      'readers': '1.5M',
      'genres': ['Science Fiction', 'Action']
    },
    {
      'title': 'Book Y',
      'cover': 'assets/book_cover.jpeg',
      'rating': 4.6,
      'readers': '1.0M',
      'genres': ['Horror', 'Supernatural']
    },
    {
      'title': 'Book Z',
      'cover': 'assets/book_cover.jpeg',
      'rating': 4.8,
      'readers': '1.8M',
      'genres': ['Comedy', 'Slice of Life']
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        body: Column(
          children: [
            // Tabs and TabBarView
            Expanded(
              child: Column(
                children: [
                  const TabBar(
                    indicatorColor: Color(0xFF558B2F),
                    labelColor: Color(0xFF558B2F),
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Top Ranking'),
                      Tab(text: 'Top Popular'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildBookList(topRankingBooks),
                        _buildBookList(topPopularBooks),
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


  Widget _buildBookList(List<Map<String, dynamic>> books) {
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              book['cover'],
              width: 50,
              height: 75,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            book['title'],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text('${book['rating']}'),
                  const SizedBox(width: 16),
                  const Icon(Icons.people, color: Colors.grey, size: 16),
                  const SizedBox(width: 4),
                  Text('${book['readers']}'),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                book['genres'].join(', '),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).primaryColor,
          ),
          onTap: () {
            // Navigate to book details page
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => BookDetailsPage(title: book['title']),
            //   ),
            // );
            context.go("/home/book-info");
          },
        );
      },
      separatorBuilder: (context, index) => const Divider(),
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
