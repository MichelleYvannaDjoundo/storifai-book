import 'package:flutter/material.dart';

void main() => runApp(CategoryFormApp());

class CategoryFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: Colors.blue,
      ),
      home: CategoryFormPage(),
    );
  }
}

class CategoryFormPage extends StatefulWidget {
  @override
  _CategoryFormPageState createState() => _CategoryFormPageState();
}

class _CategoryFormPageState extends State<CategoryFormPage> {
  List<String> _selectedCategories = [];
  List<String> _categories = [
    'Science Fiction',
    'Mystery',
    'Romance',
    'Fantasy',
    'Biography',
    'Self-Help',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Book Categories'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: _categories.map((String category) {
          return Container(
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: CheckboxListTile(
              title: Text(category),
              value: _selectedCategories.contains(category),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedCategories.add(category);
                  } else if (value == false) {
                    _selectedCategories.remove(category);
                  }
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Next'),
        onPressed: () {
          print(_selectedCategories);
        },        
        icon: Icon(Icons.arrow_forward),        
      ),
    );
  }
}
