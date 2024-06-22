import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_auth/auth/login_or_register.dart';
import 'package:login_auth/firebase_options.dart';
import 'package:login_auth/theme/dark_mode.dart';
import 'package:login_auth/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
