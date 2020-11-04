import 'package:flutter/material.dart';
import 'package:projet_volaille/screens/auth/login.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(224, 224, 224, 1),
      appBar: AppBar(
        title: Center(
            child: Text(
          "VOL'AYY",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),
        backgroundColor: Color.fromRGBO(166, 124, 0, 1),
        elevation: 5.0,
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: LoginPage()),
    );
  }
}
