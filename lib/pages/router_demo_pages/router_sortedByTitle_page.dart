import 'package:Homework4/model/user.dart';
import 'package:Homework4/widgets/booksForTitle.dart';
import 'package:flutter/material.dart';

class SortedByTitlePage extends StatelessWidget {
  const SortedByTitlePage({super.key});

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
        backgroundColor: const Color.fromARGB(255, 231, 221, 246),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sorted by Title',
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
              return UserListTile2(user: user);
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
