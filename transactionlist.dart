import 'package:flutter/material.dart';
import 'package:flutter_app_demo_1/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});

  /*List<Widget> _buildWidgetList() {
    int index = 0;
    return transactions.map((e) {
      index++;
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: index % 2 == 0 ? Colors.pink : Colors.amber,
        child: ListTile(
          leading: const Icon(Icons.sort),
          title: Text(
            'Name : ${e.name}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Code : ${e.code}'),
          onTap: () {
            print('You clicked : ' + e.name.toString());
          },
        ),
      );
    }).toList();
  }*/
  int index = 0;

  ListView _buildListView() {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: index % 2 == 0 ? Colors.pink : Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Name : ${transactions[index].name}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Code : ${transactions[index].code}'),
                Text(
                    'Date : ${DateFormat.yMd().format(transactions[index].createdDate)}')
              ],
            ),
            /*child: ListTile(
              leading: const Icon(Icons.sort),
              title: Text(
                'Name : ${transactions[index].name}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Code : ${transactions[index].code}'),
              onTap: () {
                print('You clicked : ' + transactions[index].name.toString());
              },
            ),*/
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //make scroll
    //1.listview(children)
    //2.listview(itembuilder)
    return Container(
      height: 500,
      child: this._buildListView(),
    );
  }
}
