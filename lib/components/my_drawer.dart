import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_auth/pages/profile_page.dart';
import 'package:login_auth/pages/users_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            //drawer header
            DrawerHeader(
                child: Icon(Icons.favorite,
                    color: Theme.of(context).colorScheme.inversePrimary)),

            //home tile
            Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("H O M E"),
                    //we are already in home page so just pop drawer
                    onTap: () => Navigator.pop(context))),

            //profile tile
            Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("P R O F I L E"),
                    //we are already in home page so just pop drawer
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilePage())))),

            //users tile
            Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: ListTile(
                    leading: const Icon(Icons.group),
                    title: const Text("U S E R S"),
                    //we are already in home page so just pop drawer
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UsersPage())))),
          ]),

          //logout
          Padding(
              padding: const EdgeInsets.only(left: 30.0, bottom: 24.0),
              child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("L O G O U T"),
                  //we are already in home page so just pop drawer
                  onTap: () => logout()))
        ],
      ),
    );
  }
}
