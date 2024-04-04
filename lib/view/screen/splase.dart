import 'dart:async';
import 'package:flutter/material.dart';

class Spl extends StatefulWidget {
  const Spl({super.key});

  @override
  State<Spl> createState() => _SplState();
}

class _SplState extends State<Spl> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushNamed('/home');
    });
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.tealAccent,
          image: DecorationImage(
              image: AssetImage("aasets/img/bg/bg2.jpg"), fit: BoxFit.cover)),
    ));
  }
}