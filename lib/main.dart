import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _text = '';
  final List<String> items = ['C', '+', '-', '*', '/', '=', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  @override
  Widget build(BuildContext context) {
    var gridList = List<Widget>.generate(items.length, (idx) {
      return Container(
          width: 50,
          child: RaisedButton(
              color: Colors.amber,
              child: Text(
                items[idx],
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                setState(() {
                  if (items[idx] == 'C')
                    _text = '';
                  else
                    _text += items[idx];
                });
              }));
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('계산기'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  height: 50,
                  child: Text(_text, style: TextStyle(fontSize: 40))),
              Container(
                  height: 400,
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: gridList,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
