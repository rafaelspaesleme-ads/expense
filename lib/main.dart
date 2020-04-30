import 'dart:math';
import 'package:expense/components/chart.dart';
import 'package:expense/components/transactionForm.dart';
import 'package:expense/components/transactionList.dart';
import 'package:flutter/material.dart';

import 'package:expense/models/transaction.dart';

main() => runApp(ExpenseApp());

class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.purple[100],
        primaryColorLight: Colors.purple[200],
        backgroundColor: Colors.purple[100],
        cardColor: Colors.purple[800],
        buttonColor: Colors.amber[400],
        accentColor: Colors.black,
        fontFamily: 'Baloo Tamma 2'
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _transactions = [
    Transaction(id: 't1', title: 'Tenis Nike Shox', value: 310.90, date: DateTime.now().subtract(Duration(days: 38))),
    Transaction(id: 't1', title: 'Tenis Nike Shox', value: 310.90, date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(id: 't2', title: 'Conta de Internet', value: 190.00, date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(id: 't3', title: 'Conta de Luz', value: 250.00, date: DateTime.now().subtract(Duration(days: 5))),
    Transaction(id: 't4', title: 'Conta de Agua', value: 100090.00, date: DateTime.now().subtract(Duration(days: 6))),
    Transaction(id: 't5', title: 'Conta de Telefone', value: 60.00, date: DateTime.now().subtract(Duration(days: 7))),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7)
      ));
    }).toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now()
    );
    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Despesas Pessoais', 
        style: TextStyle(color: Theme.of(context).primaryColor),),
        backgroundColor: Theme.of(context).cardColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            color: Theme.of(context).primaryColor,
            onPressed: () => _openTransactionFormModal(context),
            )
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Chart(_transactions),
            TransactionList(_transactions)
            ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).buttonColor,
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}