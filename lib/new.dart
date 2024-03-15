import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class New extends StatefulWidget {
  const New({super.key});

  @override
  State<New> createState() => NewState();
}

class NewState extends State<New> {
  TextEditingController nameController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  bool visible = false;

  static const String KEYNAME = "name";
  var nameValue = "No value Saved";

  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Session Management",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                Icons.person,
                size: 100,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: placeController,
                decoration: InputDecoration(
                    labelText: "Place",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setString(KEYNAME, nameController.text.toString());
                  },
                  child: Text("Save")),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(nameValue),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.place),
                      title: Text("${placeController.text}"),
                    ),
                  ],
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getName = prefs.getString(KEYNAME);

    nameValue = getName ?? "No value safed";
    setState(() {});
  }
}
