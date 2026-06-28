import 'package:flutter/material.dart';

import '../models/lesson_model.dart';
import '../services/firestore_service.dart';
import '../widgets/lesson_card.dart';

class LessonsScreen extends StatelessWidget {
  LessonsScreen({super.key});

  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1020),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1020),
        elevation: 0,
        title: const Text(
          "Language Lessons",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: StreamBuilder<List<LessonModel>>(
        stream: firestoreService.getLessons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "No lessons found",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }

          final lessons = snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text(
                    "Start Learning 🚀",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "${lessons.length} lessons available",
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00D4FF), Color(0xFF8B5CF6)],
                      ),
                    ),

                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Learning Goal",
                          style: TextStyle(color: Colors.white),
                        ),

                        SizedBox(height: 10),

                        Text(
                          "Complete all lessons",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lessons.length,
                    itemBuilder: (context, index) {
                      return LessonCard(lesson: lessons[index]);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
