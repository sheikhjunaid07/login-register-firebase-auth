import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_auth/components/my_button.dart';
import 'package:login_auth/components/my_text_field.dart';
import 'package:login_auth/helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  void register() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    //make sure password match
    if (passwordController.text != confirmPwController.text) {
      Navigator.pop(context);

      //show error to user
      displayErrorMsgToUser("Password don't match", context);
    } else {
      //if password matched
      try {
        //creating a user
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        //create a user document and add to firebase
        createUserDocument(userCredential);

        //pop loading circle
        if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //pop loading circle
        Navigator.pop(context);

        //display error msg to user
        displayErrorMsgToUser(e.code, context);
      }
    }
  }

  //create a user document and collect them in firebase
  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': usernameController.text
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(children: [
                  const SizedBox(height: 50),
                  //logo
                  Icon(
                    Icons.person,
                    size: 80,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  const SizedBox(height: 20),
                  //app name
                  const Text("R e g i s t e r ",
                      style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 20),

                  //username textfield
                  MyTextField(
                      hintText: "Username",
                      obsecureText: false,
                      controller: usernameController),

                  const SizedBox(height: 20),

                  //email textfield
                  MyTextField(
                      hintText: "Email",
                      obsecureText: false,
                      controller: emailController),

                  const SizedBox(height: 20),
                  //password textfield
                  MyTextField(
                      hintText: "Password",
                      obsecureText: true,
                      controller: passwordController),

                  const SizedBox(height: 25),

                  //confirm password textfield
                  MyTextField(
                      hintText: "Confirm Password",
                      obsecureText: true,
                      controller: confirmPwController),

                  const SizedBox(height: 18),

                  //login button
                  MyButton(text: "Register", onTap: () => register()),

                  const SizedBox(height: 8),

                  //Already have account "login"
                  Row(children: [
                    Text("Already have an account ",
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary)),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: const Text("Login here",
                            style: TextStyle(fontWeight: FontWeight.bold)))
                  ])
                ]))));
  }
}
