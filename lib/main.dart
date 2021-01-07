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
  String _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TimePicker'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Future<TimeOfDay> selectedDate = showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );
                selectedDate.then((timeOfDay) {
                  setState(() {
                    _selectedTime = '${timeOfDay.hour}:${timeOfDay.minute}';
                  });
                });
              },
              child: Text('Time Picker'),
            ),
            Text('$_selectedTime'),
          ],
        ),
    );
  }
}