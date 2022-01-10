// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'cmp.dart';
import 'more.dart';

class Result extends StatelessWidget {
  final bmi;
  final String result;
  const Result({required this.bmi, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'BMI Calculator',
                style: style,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Your BMI is',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                bmi.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '$result',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: chosecolor(bmi)),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => About()));
                },
                child: Text('More'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

chosecolor(bmi) {
  if (bmi < 18.5) {
    return Colors.yellow[600];
  } else if (bmi < 25) {
    return Colors.green[700];
  } else if (bmi < 30) {
    return Colors.red[400];
  } else {
    return Colors.red[800];
  }
}
