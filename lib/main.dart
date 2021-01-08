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
      home: GradeMain(),
    );
  }
}

class GradeMain extends StatefulWidget {
  @override
  _GradeMainState createState() => _GradeMainState();
}

class _GradeMainState extends State<GradeMain> {
  List<Widget> _children = [];
  List _gradeList = ['A+'];
  List _creditList = ['3'];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _add();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('학점 계산기')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.add), onPressed: _add),
              Flexible(
                child: ListView(children: _children),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GradeResult(_gradeList, _creditList)),
                      );
                    },
                  child: Text('결과'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final _gradeValueList = ['A+', 'A-', 'A0', 'B+', 'B0', 'B-', 'C+', 'C0', 'C-', 'D+', 'D0', 'D-', 'F'];
  var _gradeSelectedValue = 'A+';
  final _creditValueList = ['3', '2', '1'];
  var _creditSelectedValue = '3';

  void _add() {
    _children = List.from(_children)
      ..add(Row(
        children: <Widget>[
          Container(
            width: 100,
            child: TextFormField(
              decoration: InputDecoration(hintText: "과목명"),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 100,
            child: DropdownButtonFormField(
              value: _gradeSelectedValue,
              items: _gradeValueList.map(
                  (value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  _gradeSelectedValue = value;
                  _gradeList.add(_gradeSelectedValue);
                });
              }
            )
          ),
          SizedBox(width: 10),
          Container(
              width: 100,
              child: DropdownButtonFormField(
                  value: _creditSelectedValue,
                  items: _creditValueList.map(
                        (value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      _creditSelectedValue = value;
                      _creditList.add(_creditSelectedValue);
                    });
                  }
              )
          ),
        ],
      )
    );
    setState(() {});
  }
}

class GradeResult extends StatelessWidget {
  final List gradeList;
  final List creditList;

  GradeResult(this.gradeList, this.creditList);

  @override
  Widget build(BuildContext context) {
    print(gradeList);
    print(creditList);
    double totalGrade = 0.0;
    int totalCredit = 0;
    for (int i = 0; i < gradeList.length; i++) {
      totalGrade += _calcGrade(gradeList[i], creditList[i]);
      totalCredit += int.parse(creditList[i]);
    }
    return Scaffold(
      appBar: AppBar(title: Text('학점 계산기')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'GPA\n' + (totalGrade / totalCredit).toStringAsFixed(2),
              style: TextStyle(fontSize: 36),
            ),
          ],
        ),
      ),
    );
  }

  double _calcGrade(String grade, String credit) {
    double result = 0;
    if (grade == 'A+') {
      result += 4.5;
    } else if (grade == 'A0') {
      result += 4.2;
    } else if (grade == 'A-') {
      result += 4.0;
    } else if (grade == 'B+') {
      result += 3.6;
    } else if (grade == 'B0') {
      result += 3.3;
    } else if (grade == 'B-') {
      result += 3.0;
    } else if (grade == 'C+') {
      result += 2.6;
    } else if (grade == 'C0') {
      result += 2.3;
    } else if (grade == 'C-') {
      result += 2.0;
    } else if (grade == 'D+') {
      result += 1.6;
    } else if (grade == 'D0') {
      result += 1.3;
    } else if (grade == 'D-') {
      result += 1.0;
    } else {
      result += 0.0;
    }
    return result * (int.parse(credit));
  }
}