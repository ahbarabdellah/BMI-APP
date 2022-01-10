// ignore_for_file: prefer_const_constructors    fontWeight: FontWeight.bold);

import 'package:flutter/material.dart';
import 'result.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(primarySwatch: Colors.teal, canvasColor: Colors.black),
      home: Home(),
    );
  }
}
