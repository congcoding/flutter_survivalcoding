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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GestureDetector, InkWell'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print('GestureDetector 클릭!!');
                },
                child: Text('클릭 Me!!'),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  print('InkWell 클릭!!');
                },
                child: Text('클릭 Me!!'),
              ),
            ],
          ),
        )
    );
  }
}