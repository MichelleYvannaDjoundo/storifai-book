import 'package:ashresume/Services/http.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizScreen extends StatefulWidget {
  final String summaryId;
  const QuizScreen({required this.summaryId});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<dynamic> questions = [];
  Map<int, int> selectedAnswers =
      {}; // Initialize selectedAnswers as an empty Map
  HttpService _httpService = Get.put(HttpService());

  Future<List<dynamic>> fetchData() async {
    print(widget.summaryId);
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
    fetchData().then((value) {
      setState(() {
        questions = value[0]["questions"];
      });
    });
  }

  Color getCheckBoxColor(int questionIndex, int choiceIndex) {
    // Get the correct answer index for the question
    int correctAnswerIndex = questions[questionIndex]['answer'];
    // Get the selected answer for the question
    int? selectedAnswerIndex = selectedAnswers[questionIndex];

    if (selectedAnswerIndex == choiceIndex) {
      return const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5);
    } else {
      // Not selected answer
      return const Color.fromARGB(122, 158, 158, 158);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('questions'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, questionIndex) {
          Map<String, dynamic> question = questions[questionIndex];

          List<dynamic> answerChoices = question['answer_choices'];
          int? selectedAnswerIndex = selectedAnswers.containsKey(questionIndex)
              ? selectedAnswers[questionIndex]
              : -1;

          return ListTile(
            title: Text(question['content']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: answerChoices.asMap().entries.map((entry) {
                int choiceIndex = entry.key;
                dynamic answerChoice = entry.value;
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        getCheckBoxColor(questionIndex, choiceIndex),
                    child: IconButton(
                      icon: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          // Update the selected answer for the question
                          selectedAnswers[questionIndex] = choiceIndex;
                        });
                      },
                    ),
                  ),
                  title: Text(answerChoice.toString()),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
