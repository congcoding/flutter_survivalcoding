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
      home: FirstPage(),
    );
  }
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('다음 페이지로'),
                onPressed: () async {
                  final person = Person('홍길동', 20);
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage(person: person)),
                  );
                  print(result);
                },
              )
            ]
          )
        )
      )
    );
  }
}

class SecondPage extends StatelessWidget {
  final Person person;

  SecondPage({@required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('이전 페이지로'),
                onPressed: () {
                Navigator.pop(context, 'ok');
                }
              ),
              Text(person.name + " " + person.age.toString()),
            ]
          )
        )
      )
    );
  }
}