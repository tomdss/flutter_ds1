import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyAppDate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppDateState();
  }
}

class _MyAppDateState extends State<MyAppDate> {
  DateTime dateNow = new DateTime.now();
  DateTime dateAny = new DateTime(2020, 4, 5);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'MyAppDate',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                // 'Data time : \n${dateNow.toString()}',
                // 'Data time : \n${dateAny.toString()}',
                // DateFormat.yMMMd().format(dateNow),
                // number format
                NumberFormat('##.##', 'en_US').format(112.7647364734),
                style: TextStyle(fontSize: 25, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
