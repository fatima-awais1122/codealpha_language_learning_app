import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/lesson_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<LessonModel>> getLessons() {
    return _firestore.collection('lessons').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return LessonModel.fromFirestore(doc.data(), doc.id);
      }).toList();
    });
  }
}
