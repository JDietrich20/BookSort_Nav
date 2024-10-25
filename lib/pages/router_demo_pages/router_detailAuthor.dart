import 'package:flutter/material.dart';

class BookByAuthor extends StatelessWidget {
  final String? source;

  // const BookByAuthor({super.key});
  const BookByAuthor({super.key, this.source});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book"),
        actions: const [Icon(Icons.person)],
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 231, 221, 246),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Detail of Book"),
          ],
        ),
      ),
    );
  }
}
