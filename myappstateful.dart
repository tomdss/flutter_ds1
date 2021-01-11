import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyAppStateFul extends StatefulWidget {
  String name;
  int age;

  MyAppStateFul({this.name, this.age});

  @override
  State<StatefulWidget> createState() {
    print('createState');
    return _MyAppState();
  }
}

class _MyAppState extends State<MyAppStateFul> with WidgetsBindingObserver {
  String _email = '';
  final emailEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
    emailEditingController.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print('Bg mode');
    } else if (state == AppLifecycleState.resumed) {
      print('fg mode');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return MaterialApp(
      title: 'StateFul',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  controller: emailEditingController,
                  onChanged: (textInput) {
                    this.setState(() {
                      _email = textInput;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(const Radius.circular(10.0))),
                      labelText: 'Input text line 1'),
                ),
              ),
              Text('$_email',
                  style: TextStyle(fontSize: 27, color: Colors.red)),
              Text('This is stateful 3 ${widget.name}',
                  style: TextStyle(fontSize: 27, color: Colors.red))
            ],
          ),
        ),
      ),
    );
  }
}
