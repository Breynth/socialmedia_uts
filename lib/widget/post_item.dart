import 'package:flutter/material.dart';
import '../model/post.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header (Avatar + Username)
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(post.profilePic),
          ),
          title: Text(
            post.username,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.more_vert),
        ),

        // Image
        Image.network(
          post.imageUrl,
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        // Action icons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            children: const [
              Icon(Icons.favorite_border),
              SizedBox(width: 16),
              Icon(Icons.comment_outlined),
              SizedBox(width: 16),
              Icon(Icons.send_outlined),
            ],
          ),
        ),

        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: post.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: " "),
                TextSpan(text: post.caption),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}
