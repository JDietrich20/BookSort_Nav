import 'package:Homework4/navigation/routerdemo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/user.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.goNamed(RouteName.bookDetailAuthor);
        },
        child: const ListTile(
          title: Text('Da Vinci Code'),
          subtitle: Text('Dan Brown'),
        ));
  }
}
