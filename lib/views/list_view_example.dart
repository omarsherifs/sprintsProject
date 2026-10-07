import 'package:flutter/material.dart';

class ListViewExample extends StatefulWidget {
  const ListViewExample({super.key});

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  List<String> names = [
    "Omar",
    "Ali",
    "Ahmed",
    "Mohamed",
    "Sara",
    "Fatima",
    "Hassan",
    "Aisha",
    "Youssef",
    "Layla",
    "maged",
    "alaa",
    "mohamed",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(names[index]), trailing: Icon(Icons.contact_page));
        },
      ),
    );
  }
}
