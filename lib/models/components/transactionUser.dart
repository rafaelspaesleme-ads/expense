import 'dart:math';

import 'package:expense/models/components/transactionForm.dart';
import 'package:expense/models/components/transactionList.dart';
import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _transactions = [
    Transaction(id: 't1', title: 'Tenis Nike Shox', value: 310.90, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de Internet', value: 190.00, date: DateTime.now()),
    Transaction(id: 't3', title: 'Conta de Luz', value: 250.00, date: DateTime.now()),
    Transaction(id: 't4', title: 'Conta de Agua', value: 90.00, date: DateTime.now()),
    Transaction(id: 't5', title: 'Conta de Telefone', value: 60.00, date: DateTime.now()),
  ];

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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction),
        TransactionList(_transactions)
      ],      
    );
  }
}