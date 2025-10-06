import 'package:flutter/material.dart';
import '../model/post.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late List<Post> posts;

  @override
  void initState() {
    super.initState();
    _generatePosts();
  }

  void _generatePosts() {
    posts = [
      Post(
        username: 'taywavy',
        profilePic: 'https://picsum.photos/seed/taywavy/60/60',
        imageUrl:
            'https://picsum.photos/400/400?random=${DateTime.now().millisecondsSinceEpoch % 1000}',
        caption: 'chill 🌊',
      ),
      Post(
        username: 'nle_choppa',
        profilePic: 'https://picsum.photos/seed/nle/60/60',
        imageUrl:
            'https://picsum.photos/400/400?random=${DateTime.now().millisecondsSinceEpoch % 2000}',
        caption: 'feel it 🔥',
      ),
      Post(
        username: 'eminem',
        profilePic: 'https://picsum.photos/seed/eminem/60/60',
        imageUrl:
            'https://picsum.photos/400/400?random=${DateTime.now().millisecondsSinceEpoch % 3000}',
        caption: 'woo wee',
      ),
    ];
  }

  Future<void> _refreshPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _generatePosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshPosts,
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian atas: foto profil + username
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(post.profilePic),
                ),
                title: Text(
                  post.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              // Gambar postingan
              Image.network(post.imageUrl),
              // Caption
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  post.caption,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
