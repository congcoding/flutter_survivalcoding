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

class MyHomePage extends StatelessWidget {
  final List<String> items = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('전화 자판 만들기'),
      ),
      body: GridView.count(
        crossAxisCount: 3,  // 열 개수
        children: List<Widget>.generate(items.length, (idx) {
          return Container(
            color: Colors.amber,
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.all(8),
            child: Text(
                items[idx],
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
            ),
          );
        }).toList()
      )
    );
  }
}




