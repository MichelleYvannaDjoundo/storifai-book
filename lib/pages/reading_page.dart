import 'package:flutter/material.dart';

class KeyPointScreen extends StatelessWidget {
  final List<dynamic> keyPoints;
  final int index;

  KeyPointScreen({required this.keyPoints, required this.index});

  @override
  Widget build(BuildContext context) {
    String selectedValue = keyPoints[index]["content"]!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Key Point Details'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            '${keyPoints[index]["name"]}: $selectedValue',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
