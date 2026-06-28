import 'package:flutter/material.dart';

import '../models/lesson_model.dart';

class LessonCard extends StatelessWidget {
  final LessonModel lesson;

  const LessonCard({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),

      decoration: BoxDecoration(
        color: const Color(0xFF182033),
        borderRadius: BorderRadius.circular(24),

        border: Border.all(color: Colors.white10),

        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),

                  decoration: BoxDecoration(
                    color: const Color(0xFF00D4FF).withValues(alpha: 0.15),

                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: const Icon(
                    Icons.menu_book_rounded,
                    color: Color(0xFF00D4FF),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Text(
                    lesson.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            Text(
              lesson.description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 15,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 18),

            LinearProgressIndicator(
              value: 0.65,
              minHeight: 8,

              borderRadius: BorderRadius.circular(10),

              backgroundColor: Colors.white12,

              color: const Color(0xFF00D4FF),
            ),

            const SizedBox(height: 8),

            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "65% Complete",
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFF00D4FF).withValues(alpha: 0.15),

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Text(
                    lesson.level,
                    style: const TextStyle(
                      color: Color(0xFF00D4FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Spacer(),

                const Icon(Icons.play_circle_fill, color: Color(0xFF8B5CF6)),

                const SizedBox(width: 6),

                Text(
                  "${lesson.lessons} Lessons",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
