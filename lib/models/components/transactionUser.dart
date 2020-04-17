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
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_transactions),
        TransactionForm()
      ],      
    );
  }
}