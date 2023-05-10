import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<String> _favoriteItems = [
    'photo 1',
    'photo 2',
    'photo 3',
    'photo 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: _favoriteItems.isEmpty
          ? Center(
        child: const Text('You have no favorite items.'),
      )
          : ListView.builder(
        itemCount: _favoriteItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_favoriteItems[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _favoriteItems.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}