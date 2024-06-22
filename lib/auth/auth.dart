import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_auth/auth/login_or_register.dart';
import 'package:login_auth/pages/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //if user logged in
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              //user not logged in
              return const LoginOrRegister();
            }
          }),
    );
  }
}
