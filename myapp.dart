import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  String name;
  int age;

  MyApp({this.name, this.age});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hh",
      home: Scaffold(
        body: Center(
            child: Text('Hello world $name age = $age',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
                textDirection: TextDirection.ltr)),
      ),
    );
  }
}