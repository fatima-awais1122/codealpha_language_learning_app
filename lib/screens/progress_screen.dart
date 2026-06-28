import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int quizzesTaken = 0;
  String averageScore = "0";

  @override
  void initState() {
    super.initState();
    loadProgress();
  }

  Future<void> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final historyString = prefs.getString("quiz_history") ?? "[]";
    final List history = jsonDecode(historyString);

    int totalQuizzes = history.length;
    int totalScore = 0;

    for (var quiz in history) {
      final parts = quiz["score"].split("/");
      totalScore += int.parse(parts[0]);
    }

    setState(() {
      quizzesTaken = totalQuizzes;
      averageScore = totalQuizzes > 0
          ? (totalScore / totalQuizzes).toStringAsFixed(1)
          : "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1020),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1020),
        title: const Text("Progress"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _progressCard("Quizzes Taken", "$quizzesTaken"),
            _progressCard("Average Score", averageScore),
          ],
        ),
      ),
    );
  }

  Widget _progressCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF182033),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
