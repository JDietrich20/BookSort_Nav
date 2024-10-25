//Login Page
import 'package:Homework4/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouterLogin extends StatelessWidget {
  const RouterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login",
              style: TextStyle(fontWeight: FontWeight.w400)),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 231, 221, 246),
        ),
        body: Center(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 96, 72, 139),
              fixedSize: const Size(350, 40)),
          child: const Text("Login", style: TextStyle(color: Colors.white)),
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context)
                .add(AuthenticationLoginEvent());
          },
        )));
  }
}
