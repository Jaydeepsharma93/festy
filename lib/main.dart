import 'package:festy/view/screen/Home.dart';
import 'package:festy/view/screen/editpost.dart';
import 'package:festy/view/screen/post.dart';
import 'package:festy/view/screen/splase.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => Spl(),
        '/home' : (context) => HomeScreen(),
        '/post' : (context) => Post(),
        '/edit' : (context) => EditPost()
      },
    );
  }
}
