import 'package:ashresume/Services/http.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizScreen extends StatefulWidget {
  final String summaryId;
  const QuizScreen({required this.summaryId});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<dynamic> quizzes = [];
  HttpService _httpService = Get.put(HttpService());

  Future<List<dynamic>> fetchData() async {
    try {
      final data = await _httpService.getSummaryQuizz(widget.summaryId);
      return data;
    } catch (e) {
      print('An error occurred while fetching data: $e');
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((value) => {
      setState(() {
        quizzes = value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizzes'),
      ),
      body: ListView.builder(
        itemCount: quizzes.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> quiz = quizzes[index];
          String questionText = quiz['questions'];
          String options = quiz['responses'];
          return ListTile(
            title: Text(questionText),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Container()],
            ),
          );
        },
      ),
    );
  }
}
