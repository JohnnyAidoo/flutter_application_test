import 'package:flutter/material.dart';
import 'package:flutter_application_test/main.dart';

class SavedPairsPage extends StatelessWidget {
  const SavedPairsPage({super.key, required List<String> savedPairs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Saved Pairs'),
        ),
        body: ListView(
          children: savedPairs.map((e) {
            return ListTile(title: Text(e));
          }).toList(),
        ));
  }
}
