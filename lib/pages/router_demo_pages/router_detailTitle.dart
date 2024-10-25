import 'package:flutter/material.dart';

class BookByTitle extends StatelessWidget {
  const BookByTitle({super.key});

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
