import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo_1/transaction.dart';
import 'package:flutter_app_demo_1/transactionlist.dart';

class MyAppLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppLayoutState();
  }
}

class _MyAppLayoutState extends State<MyAppLayout> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // String _name = '';
  // double _code = 0.0;
  Transaction _transaction = Transaction(name: '', code: 0.0);
  List<Transaction> _transactions = List<Transaction>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: 'MyAppLayoutState',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("data"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    this._insertTransaction();
                  });
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add transaction',
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              this._insertTransaction();
            });
          },
        ),
        key: _scaffoldKey,
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'name'),
                  controller: _nameController,
                  onChanged: (text) {
                    this.setState(() {
                      _transaction.name = text;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'code'),
                  controller: _passwordController,
                  onChanged: (text) {
                    this.setState(() {
                      _transaction.code = double.tryParse(text) ?? 0;
                    });
                  },
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
                ButtonTheme(
                  height: 45,
                  // child : 1 the chua 1 the khac
                  child: FlatButton(
                      child: Text('Enter', style: TextStyle(fontSize: 16)),
                      color: Colors.pink,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          this._insertTransaction();
                        });
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text('listTransaction = $_transactions'),
                            duration: Duration(seconds: 3)));
                      }),
                ),
                TransactionList(
                  transactions: _transactions,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _insertTransaction() {
    if (_transaction.name.isEmpty ||
        _transaction.code.isNaN ||
        _transaction.code == 0.0) return;
    _transaction.createdDate = DateTime.now();
    _transactions.add(_transaction);
    _transaction = Transaction(name: '', code: 0.0);
    _nameController.text = '';
    _passwordController.text = '';
  }
}
