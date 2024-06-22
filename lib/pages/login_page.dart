import 'package:flutter/material.dart';
import 'package:login_auth/components/my_button.dart';
import 'package:login_auth/components/my_text_field.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  //text controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(
                height: 20,
              ),
              //app name
              const Text(
                "L o g i n   P a g e",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),

              //email textfield
              MyTextField(
                  hintText: "Email",
                  obsecureText: false,
                  controller: emailController),

              const SizedBox(
                height: 20,
              ),
              //password textfield
              MyTextField(
                  hintText: "Password",
                  obsecureText: true,
                  controller: passwordController),

              const SizedBox(height: 10),
              //forget password textfield
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forget Pasword",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary))
                ],
              ),

              //login button
              MyButton(text: "Login", onTap: () => login),

              const SizedBox(
                height: 8,
              ),
              //don't have account "register"
              Row(
                children: [
                  Text(
                    "Don't have an account ",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      "Register here",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
