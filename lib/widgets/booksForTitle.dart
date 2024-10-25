import 'package:Homework4/navigation/routerdemo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/user.dart';

class UserListTile2 extends StatelessWidget {
  const UserListTile2({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.goNamed(RouteName.bookDetailTitle);
        },
        child: const ListTile(
          title: Text('Da Vinci Code'),
          subtitle: Text('Dan Brown'),
        ));
  }
}
