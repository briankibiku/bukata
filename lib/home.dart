import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firestore = Firestore.instance;
  bool loader = false;
  String message;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child:
              Text('Welcome Home', style: TextStyle(color: Colors.black)),
        ),
        Container(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter a message',
            ),
            onChanged: (value) {
              message = value;
            },
          ),
        ),
        Container(
          child: FlatButton(
            child: Text('Save'),
            color: Colors.green,
            onPressed: () {
              _firestore.collection('messages').add({'messages': message});
              if(message != null){
                  Navigator.pop(context);
              }
            },
          ),
        ),
      ],
    ),
        ),
      );
  }
}
