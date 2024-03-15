import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/key.dart';
import 'package:sharedpreference/save.dart';
import 'package:sharedpreference/splash.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Login",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Icon(
              Icons.person_sharp,
              size: 100,
            )),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "password"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  // if sucessfully logged in..

                  var sharedPref = await SharedPreferences.getInstance();
                  sharedPref.setBool(SplashState.KEYLOGIN, true);

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SaveScreen()));
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
