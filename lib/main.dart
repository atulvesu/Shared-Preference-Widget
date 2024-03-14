import 'package:flutter/material.dart';
import 'package:sharedpreference/home.dart';
import 'package:sharedpreference/loginScreen.dart';
import 'package:sharedpreference/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: "Splash",
      routes: {
        "Splash": (context) => Splash(),
        "homeScreen": (context) => HomeScreen(),
        "login": (context) => LoginScreen(),
      },
    );
  }
}
