import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home age",
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan.shade300,
        actions: [
          IconButton(
              onPressed: () => logout(),
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: const Center(child: Text("Home page data")),
    );
  }
}
