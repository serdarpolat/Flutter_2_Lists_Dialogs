import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lists & Dialogs'),
      ),
      body: new _MyList(),
    );
  }
}

class _MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(4.0),
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(
            'Some Random Username',
            style:
                TextStyle(fontFamily: 'Josefin', fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Maintanence',
            style: TextStyle(
                fontFamily: 'Josefin',
                fontSize: 12.0,
                fontWeight: FontWeight.w300),
          ),
          leading: Icon(Icons.face),
          trailing: RaisedButton(
            child: Text(
              'Button',
              style:
                  TextStyle(fontFamily: 'Josefin', fontWeight: FontWeight.bold),
            ),
            color: Colors.greenAccent,
            onPressed: () => deleteDialog(context).then((value){
              print('Value Is  $value');
            }),
          ),
        );
      },
    );
  }
}

Future<bool> deleteDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Are you sure?'),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: (){
              Navigator.of(context).pop(true);
            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: (){
              Navigator.of(context).pop(false);
            },
          ),
        ],
      );
    }
  );
}
