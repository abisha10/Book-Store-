//to check the current user is logged in or not

import 'package:bookstore/pages/home.dart';
import 'package:bookstore/services/auth/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            return const HomePage();
          }
          //user is not logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
