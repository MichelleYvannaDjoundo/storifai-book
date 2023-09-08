import 'package:flutter/material.dart';

void main() => runApp(GoalFormApp());

class GoalFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: Colors.blue,
      ),
      home: GoalFormPage(),
    );
  }
}

class GoalFormPage extends StatefulWidget {
  @override
  _GoalFormPageState createState() => _GoalFormPageState();
}

class _GoalFormPageState extends State<GoalFormPage> {
  List<String> _selectedGoals = [];
  List<String> _goals = [
    'Lose Weight',
    'Learn a New Language',
    'Save Money',
    'Read More Books',
    'Be more Productive',
    'Communicate well',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Your Goals'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: _goals.map((String goal) {
          return Container(
            margin: EdgeInsets.only(bottom: 30.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: CheckboxListTile(
              title: Text(goal),
              value: _selectedGoals.contains(goal),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedGoals.add(goal);
                  } else if (value == false) {
                    _selectedGoals.remove(goal);
                  }
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/category');
          print('Selected Goals: $_selectedGoals');
        },
        icon: Icon(Icons.arrow_forward),
        label: Text('Next'),        
      ),
    );
  }
}