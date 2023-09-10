import 'package:ashresume/Services/http.service.dart';
import 'package:ashresume/pages/quiz.result.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizScreen extends StatefulWidget {
  final String summaryId;

  const QuizScreen({required this.summaryId});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<dynamic> questions = [];
  Map<int, int> selectedAnswers = {};
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

  void showResultsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultScreen(selectedAnswers: selectedAnswers),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
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
                    backgroundColor: getCheckBoxColor(questionIndex, choiceIndex),
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
      floatingActionButton: Container(
        width: 180,
        height: 60,
        child: FloatingActionButton(
          onPressed: showResultsScreen,
          child: Text('View results'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

