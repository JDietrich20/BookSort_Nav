//By Author Page for Books
//todo: make a list of interactible bookcards

import 'package:Homework4/model/user.dart';
import 'package:Homework4/widgets/booksForAuthor.dart';
import 'package:flutter/material.dart';

class SortedByAuthorPage extends StatelessWidget {
  const SortedByAuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<User> userList = List.generate(4, (index) {
      return User.createMockUser();
    });

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.person)],
        title:
            const Text("Books", style: TextStyle(fontWeight: FontWeight.w400)),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(231, 221, 246, 1),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sorted by Author',
                style: TextStyle(
                  fontSize: 24,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
                children: userList.map((user) {
              return UserListTile(user: user);
            }).toList()),
          )
          // ListView(
          //     children: userList.map((user) {
          //   return UserListTile(user: user);
          // }).toList()),
        ],
      ),
    );
  }
}
