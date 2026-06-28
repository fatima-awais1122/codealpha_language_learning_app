class LessonModel {
  final String id;
  final String title;
  final String description;
  final String level;
  final int lessons;

  LessonModel({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.lessons,
  });

  factory LessonModel.fromFirestore(Map<String, dynamic> data, String docId) {
    return LessonModel(
      id: docId,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      level: data['level'] ?? '',
      lessons: (data['lessons'] ?? 0) as int,
    );
  }
}
