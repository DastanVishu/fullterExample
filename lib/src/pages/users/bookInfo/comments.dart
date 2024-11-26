import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final List<Map<String, dynamic>> _comments = [
    {
      'id': 1,
      'user': 'User1',
      'avatar': Icons.person, // Placeholder for user icon
      'comment': 'This book is amazing!',
      'replies': [
        {
          'user': 'User2',
          'avatar': Icons.person_outline, // Placeholder for reply user icon
          'comment': 'I agree!'
        }
      ],
    },
    {
      'id': 2,
      'user': 'User3',
      'avatar': Icons.person, // Placeholder for user icon
      'comment': 'Not my favorite, but it’s decent.',
      'replies': [],
    },
  ];

  final TextEditingController _commentController = TextEditingController();
  int? _editingCommentId;

  void _addComment(String comment) {
    setState(() {
      _comments.add({
        'id': _comments.length + 1,
        'user': 'CurrentUser',
        'avatar': Icons.account_circle, // Placeholder for current user icon
        'comment': comment,
        'replies': [],
      });
    });
    _commentController.clear();
  }

  void _editComment(int id, String updatedComment) {
    setState(() {
      final comment = _comments.firstWhere((c) => c['id'] == id);
      comment['comment'] = updatedComment;
      _editingCommentId = null;
    });
    _commentController.clear();
  }

  void _deleteComment(int id) {
    setState(() {
      _comments.removeWhere((c) => c['id'] == id);
    });
  }

  void _addReply(int commentId, String reply) {
    setState(() {
      final comment = _comments.firstWhere((c) => c['id'] == commentId);
      comment['replies'].add({
        'user': 'CurrentUser',
        'avatar': Icons.account_circle, // Placeholder for reply user icon
        'comment': reply
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Add Comment Input
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    labelText: _editingCommentId == null
                        ? 'Add a comment'
                        : 'Edit your comment',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  final text = _commentController.text.trim();
                  if (text.isNotEmpty) {
                    if (_editingCommentId == null) {
                      _addComment(text);
                    } else {
                      _editComment(_editingCommentId!, text);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF558B2F), // Theme color
                ),
                child: Text(_editingCommentId == null ? 'Post' : 'Save'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                final comment = _comments[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Comment Display
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(comment['avatar']),
                        backgroundColor: const Color(0xFF558B2F), // Theme color
                        foregroundColor: Colors.white,
                      ),
                      title: Text(comment['user']),
                      subtitle: Text(comment['comment']),
                      trailing: comment['user'] == 'CurrentUser'
                          ? PopupMenuButton<String>(
                              onSelected: (value) {
                                if (value == 'Edit') {
                                  setState(() {
                                    _editingCommentId = comment['id'];
                                    _commentController.text = comment['comment'];
                                  });
                                } else if (value == 'Delete') {
                                  _deleteComment(comment['id']);
                                }
                              },
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 'Edit',
                                  child: Text('Edit'),
                                ),
                                const PopupMenuItem(
                                  value: 'Delete',
                                  child: Text('Delete'),
                                ),
                              ],
                            )
                          : null,
                    ),
                    // Replies
                    if (comment['replies'].isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          children: comment['replies']
                              .map<Widget>((reply) => ListTile(
                                    leading: CircleAvatar(
                                      child: Icon(reply['avatar']),
                                      backgroundColor: Colors.grey[300],
                                      foregroundColor: Colors.black,
                                    ),
                                    title: Text(reply['user']),
                                    subtitle: Text(reply['comment']),
                                  ))
                              .toList(),
                        ),
                      ),
                    // Reply Input
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: TextButton.icon(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              final TextEditingController replyController =
                                  TextEditingController();
                              return AlertDialog(
                                title: const Text('Reply to comment'),
                                content: TextField(
                                  controller: replyController,
                                  decoration: const InputDecoration(
                                    labelText: 'Enter your reply',
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      final reply = replyController.text.trim();
                                      if (reply.isNotEmpty) {
                                        _addReply(comment['id'], reply);
                                      }
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Post'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.reply, color: Colors.grey),
                        label: const Text('Reply'),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
