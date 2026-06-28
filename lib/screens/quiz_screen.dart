import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;

  final List<Map<String, dynamic>> questions = [
    {
      "question": "Hello = ?",
      "options": ["Hola", "Agua", "Gracias", "Amigo"],
      "answer": "Hola",
    },
    {
      "question": "Thank you = ?",
      "options": ["Gracias", "Perro", "Casa", "Amor"],
      "answer": "Gracias",
    },
    {
      "question": "Friend = ?",
      "options": ["Amigo", "Libro", "Sol", "Agua"],
      "answer": "Amigo",
    },
  ];

  void checkAnswer(String selected) {
    if (selected == questions[currentIndex]["answer"]) {
      score++;
    }
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      saveQuizResult();
      Navigator.pushReplacementNamed(context, '/quizHistory');
    }
  }

  Future<void> saveQuizResult() async {
    final prefs = await SharedPreferences.getInstance();
    final historyString = prefs.getString("quiz_history") ?? "[]";
    final List history = jsonDecode(historyString);

    history.add({
      "title": "Spanish Basics",
      "score": "$score/${questions.length}",
      "date": DateTime.now().toString().split(" ")[0],
    });

    await prefs.setString("quiz_history", jsonEncode(history));
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentIndex];
    return Scaffold(
      backgroundColor: const Color(0xFF0B1020),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1020),
        title: const Text("Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${currentIndex + 1}/${questions.length}",
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              q["question"],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...q["options"].map<Widget>((opt) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF182033),
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  onPressed: () => checkAnswer(opt),
                  child: Text(
                    opt,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
