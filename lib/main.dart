import 'package:arwa_quiz_f/LoginPage.dart';
import 'package:arwa_quiz_f/MyHomePage.dart';
import 'package:arwa_quiz_f/SharedPreController.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreController().getInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SharedPreController().getData("login") ?? false
                      ? MyHomePage()
                      : LoginPage(),
            ));
      },
    );
    return Scaffold(
        backgroundColor: Colors.cyan.shade50,
        body: Container(
          child: Center(
            child: Text("Welcome",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          ),
        ));
  }
}
