import 'package:flutter/material.dart';

class QuizResultScreen extends StatelessWidget {
  final Map<int, int> selectedAnswers;

  const QuizResultScreen({required this.selectedAnswers});

  @override
  Widget build(BuildContext context) {
    // Compute the quiz results
    int totalQuestions = selectedAnswers.length;
    int correctAnswers = 0;

    selectedAnswers.forEach((questionIndex, selectedChoiceIndex) {
      // Get the correct choice index for the question
      int correctChoiceIndex = getCorrectChoiceIndex(questionIndex);

      // Check if the selected choice is correct
      if (selectedChoiceIndex == correctChoiceIndex) {
        correctAnswers++;
      }
    });

    // Compute the percentage score
    double percentageScore = (correctAnswers / totalQuestions) * 100;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Quiz Results',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Total Questions: $totalQuestions'),
            SizedBox(height: 8),
            Text('Correct Answers: $correctAnswers'),
            SizedBox(height: 8),
            Text('Percentage Score: ${percentageScore.toStringAsFixed(2)}%'),
          ],
        ),
      ),
    );
  }

  // Dummy function to get the correct choice index for a question
  int getCorrectChoiceIndex(int questionIndex) {
    // Replace with your logic to retrieve the correct choice index
    // based on the given question index
    // This is just a dummy implementation
    return questionIndex % 4;
  }
}