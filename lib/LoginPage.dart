import 'package:arwa_quiz_f/MyHomePage.dart';
import 'package:arwa_quiz_f/SharedPreController.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 100,
                ),
                TextField(
                  decoration: InputDecoration(
                    label: Text("User name"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    label: Text("Password"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
                CheckboxListTile(
                  value: flag,
                  onChanged: (value) {
                    setState(() {
                      flag = value!;
                    });
                  },
                  title: Text(
                    "?Remember me",
                    textDirection: TextDirection.rtl,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          fixedSize: Size(320, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () async {
                        SharedPreController c = SharedPreController();
                        await c.getInit();
                        c.setData(key: "login", value: flag);
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ));
                      },
                      child: Text("Login")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
