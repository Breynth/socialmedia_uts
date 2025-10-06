import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> results = [];

  void _onSearchChanged(String query) {
    // pencarian dummy
    setState(() {
      results = query.isEmpty
          ? []
          : List.generate(3, (i) => 'Result ${i + 1} for "$query"');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        elevation: 4,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                decoration: const InputDecoration(
                  labelText: 'Search...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: results.isEmpty
                    ? const Center(
                        child: Text('No results yet'),
                      )
                    : ListView.builder(
                        itemCount: results.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(results[index]),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
