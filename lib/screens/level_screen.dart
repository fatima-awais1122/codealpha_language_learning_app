import 'package:flutter/material.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy achievements (future mein tum Firestore se fetch kar sakti ho)
    final achievements = [
      {"title": "Beginner Learner", "unlocked": true},
      {"title": "Quiz Master", "unlocked": true},
      {"title": "Advanced Learner", "unlocked": false},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0B1020),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1020),
        elevation: 0,
        title: const Text(
          "Your Level",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Current Level 🏆",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Track your achievements and progress",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 25),

            // Current Level Card
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
                    "Level 3",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Intermediate Learner",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Achievements",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: achievements.length,
                itemBuilder: (context, index) {
                  final achievement = achievements[index];
                  return _achievementTile(
                    achievement["title"] as String,
                    achievement["unlocked"] as bool,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _achievementTile(String title, bool unlocked) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF182033),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            unlocked ? Icons.check_circle : Icons.lock,
            color: unlocked ? const Color(0xFF00D4FF) : Colors.white30,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: unlocked ? Colors.white : Colors.white54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
