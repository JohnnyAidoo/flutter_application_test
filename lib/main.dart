import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Random Text Generator'),
          actions: [
            IconButton(
                onPressed: () {
                  debugPrint('list');
                },
                icon: const Icon(Icons.list))
          ],
        ),
        body: const ListGen(),
      ),
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
  var savedPairs = [];

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

        var _alreadySaved = savedPairs.contains(pair);
        return ListTile(
          onTap: () {
            setState(() {
              _alreadySaved ? savedPairs.remove(pair) : savedPairs.add(pair);
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
