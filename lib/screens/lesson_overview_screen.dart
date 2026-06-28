import 'package:flutter/material.dart';

class LessonOverviewScreen extends StatelessWidget {
  const LessonOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1020),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1020),
        elevation: 0,
        title: const Text(
          "Lesson Roadmap",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Learning Path 🚀",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Track your lessons step by step",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 25),

            // Roadmap Card Example
            _roadmapCard(
              step: "Step 1",
              title: "Basics of Spanish",
              description: "Learn greetings, numbers, and common phrases.",
              progress: 0.4,
            ),
            _roadmapCard(
              step: "Step 2",
              title: "Intermediate Grammar",
              description: "Understand sentence structure and tenses.",
              progress: 0.2,
            ),
            _roadmapCard(
              step: "Step 3",
              title: "Conversational Practice",
              description: "Practice dialogues and real-life scenarios.",
              progress: 0.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _roadmapCard({
    required String step,
    required String title,
    required String description,
    required double progress,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF182033),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step,
            style: const TextStyle(
              color: Color(0xFF00D4FF),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 15),
          LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.white12,
            color: const Color(0xFF00D4FF),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${(progress * 100).toInt()}% Complete",
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
