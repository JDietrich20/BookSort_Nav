import 'package:flutter/material.dart';

class RouterHome extends StatelessWidget {
  const RouterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: const Center(child: Text("Router Demo Home")));
  }
}
