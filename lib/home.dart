// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bmiapp/result.dart';
import 'package:flutter/material.dart';
import 'cmp.dart';

var isMale = true;
var age = 18;
double height = 150.00;
var weight = 50;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Mass Index',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'Cera Pro',
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  M_Fblock(1),
                  M_Fblock(2),
                ],
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Cera Pro',
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            height.toStringAsFixed(1),
                            style: style,
                          ),
                          Text(
                            ' cm',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Slider(
                        min: 20,
                        max: 300,
                        value: height,
                        onChanged: (val) {
                          setState(() {
                            height = val;
                          });
                        },
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  A_Hblock('Age'),
                  A_Hblock('Weight'),
                ],
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    double bmi = (weight / (height * height)) * 10000;
                    String result = getstr(bmi);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result(
                                  bmi: bmi,
                                  result: result,
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(214, 132, 56, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Cera Pro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded M_Fblock(int y) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: () {
          setState(() {
            ((isMale && y == 1) || (!isMale && y == 2))
                ? isMale = !isMale
                : isMale = isMale;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: ((isMale && y == 1) || (!isMale && y == 2))
                ? primaryColor
                : teal,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  y == 1 ? Icons.male : Icons.female,
                  color: Colors.white,
                  size: 70,
                ),
                Text(
                  y == 1 ? 'Male' : 'Female',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Cera Pro',
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded A_Hblock(String sectionName) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                sectionName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'Cera Pro',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                sectionName == 'Age' ? age.toString() : weight.toString(),
                style: style,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                      heroTag: sectionName == 'Age' ? 'age--' : 'weight--',
                      onPressed: () {
                        setState(() {
                          if (sectionName == 'Age') {
                            age--;
                          } else {
                            weight--;
                          }
                        });
                      },
                      child: Icon(Icons.remove)),
                  SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                      heroTag: sectionName == 'Age' ? 'age++' : 'weight++',
                      onPressed: () {
                        setState(() {
                          if (sectionName == 'Age') {
                            age++;
                          } else {
                            weight++;
                          }
                        });
                      },
                      child: Icon(Icons.add)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String getstr(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
