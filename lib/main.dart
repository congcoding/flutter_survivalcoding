import 'dart:math';

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
  var _size = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AnimatedContainer'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              final random = Random();
              setState(() {
                _size = random.nextInt(200).toDouble() + 100;
              });
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              width: _size,
              height: _size,
              child: Image.asset('assets/sample.jpg'),
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
    );
  }
}