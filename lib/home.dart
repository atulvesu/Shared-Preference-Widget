import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String KEY_NAME = "name";
  late TextEditingController nameController;
  String nameValue = "No value Saved";
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    getValue();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<void> saveValue(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(KEY_NAME, name);
  }

  Future<void> getValue() async {
    final prefs = await SharedPreferences.getInstance();
    final getName = prefs.getString(KEY_NAME);
    setState(() {
      nameValue = getName ?? "No value Saved";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Enter your name"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                saveValue(nameController.text);
                getValue();
              },
              child: Text("Save"),
            ),
            SizedBox(height: 10),
            Text(nameValue),
          ],
        ),
      ),
    );
  }
}
