import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return 
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Titulo',
                    ),
                  ),
                  TextField(
                    controller: valueController,
                    decoration: InputDecoration(
                      labelText: 'Valor (R\$)'
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: FlatButton(
                          child: Text('Nova Transação'),
                          color: Colors.purple,
                          textColor: Colors.purple[50],
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        
  }
}