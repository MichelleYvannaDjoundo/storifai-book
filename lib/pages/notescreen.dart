import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        actions: [IconButton(
          icon: Icon(Icons.done),
          onPressed: () {
            String note = _textEditingController.text.trim();
            Navigator.pop<String>(context, note);
          },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: TextField(
          controller: _textEditingController,
          autofocus: true,
          maxLines: null,
          decoration: InputDecoration(
          hintText: 'Enter your notes and remarks...',
          ),
        ),
      ),
    );
  }
}