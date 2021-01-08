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
      home: FirstStatefulPage(),
      routes: {
        '/first': (context) => FirstStatefulPage(),
        '/second': (context) => SecondStatefulPage(),
      }
    );
  }
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

class FirstStatefulPage extends StatefulWidget {
  @override
  _FirstStatefulPageState createState() => _FirstStatefulPageState();
}

class _FirstStatefulPageState extends State<FirstStatefulPage> {
  @override
  Widget build(BuildContext context) {
    print('FirstPage build()');
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      body: RaisedButton(
        child: Text('다음 페이지로'),
        onPressed: () {
          final person = Person('홍길동', 20);
              Navigator.push(
              context,
            MaterialPageRoute(builder: (context) => SecondStatefulPage(person: person)),
          );
        }
      )
    );
  }
}

class SecondStatefulPage extends StatefulWidget {
  final Person person;
  SecondStatefulPage({Key key, @required this.person}) : super(key: key);

  @override
  _SecondStatefulPageState createState() => _SecondStatefulPageState();
}

class _SecondStatefulPageState extends State<SecondStatefulPage> {
  @override
  Widget build(BuildContext context) {
    print('SecondPage build()');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.person.name),
      ),
      body:
        RaisedButton(
          child: Text('이전 페이지로'),
          onPressed: () {
            Navigator.pop(context);
          }
        )
    );
  }
}