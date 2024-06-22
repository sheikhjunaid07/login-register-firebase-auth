import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_auth/helper/helper_functions.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Users Page"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          //any error
          if (snapshot.hasError) {
            displayErrorMsgToUser("Something went wrong", context);
          }

          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          //No data
          if (snapshot.hasData == null) {
            return const Text("No data!!!!!");
          }

          //get all users
          final users = snapshot.data!.docs;

          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];

                return ListTile(
                  title: Text(user["username"]),
                  subtitle: Text(user["email"]),
                );
              });
        },
      ),
    );
  }
}
