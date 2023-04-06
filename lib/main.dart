import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_application_test/saved_pairs_page.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: RootApp()));
}

List<String> savedPairs = [];

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Text Generator'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SavedPairsPage(savedPairs: savedPairs)));
            },
          )
        ],
      ),
      body: const ListGen(),
    );
  }
}

class ListGen extends StatefulWidget {
  const ListGen({super.key});

  @override
  State<ListGen> createState() => _ListGenState();
}

class _ListGenState extends State<ListGen> {
  final _RandomWordPairs = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, item) {
        if (item.isOdd) {
          return const Divider();
        }
        final index = item ~/ 2;

        if (index >= _RandomWordPairs.length) {
          _RandomWordPairs.addAll(generateWordPairs().take(10));
        }
        var pair = _RandomWordPairs[index];

        var _alreadySaved = savedPairs.contains(pair.asPascalCase);
        return ListTile(
          onTap: () {
            setState(() {
              if (_alreadySaved) {
                savedPairs.remove(pair.asPascalCase);
              } else {
                savedPairs.add(pair.asPascalCase);
              }
            });
          },
          title: Text(pair.asPascalCase),
          trailing:
              Icon(_alreadySaved ? Icons.favorite : Icons.favorite_border),
          iconColor: (_alreadySaved ? Colors.red : null),
        );
      },
    );
  }
}
