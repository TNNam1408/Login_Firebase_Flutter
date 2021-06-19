import 'package:flutter/material.dart';
import 'package:flutterexercisefile/HomePage.dart';
import 'package:flutterexercisefile/Login.dart';
import 'package:flutterexercisefile/SignUp.dart';
import 'package:flutterexercisefile/Start.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Start(),
      // routes: <String, WidgetBuilder>{
      //   "Login" : (BuildContext context)=>Login(),
      //   "SignUp":(BuildContext context)=>SignUp(),
      //   "Start":(BuildContext context)=>Start(),
      //   "HomePage":(BuildContext context)=>HomePage(),
      // },
    );
  }
}