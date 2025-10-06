import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = 'salmonela_001';
  String bio = 'Indonesia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage('https://picsum.photos/seed/profilepic/200'),
              ),
              const SizedBox(height: 15),
              Text(
                username,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                bio,
                style: const TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
