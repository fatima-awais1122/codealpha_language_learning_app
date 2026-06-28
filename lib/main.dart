import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// ✅ Import all screens
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/lesson_overview_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/quiz_history_screen.dart';
import 'screens/level_screen.dart';
import 'screens/progress_screen.dart';
import 'screens/language_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // ✅ Firebase initialization
  runApp(const LingoMasterApp());
}

class LingoMasterApp extends StatelessWidget {
  const LingoMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LingoMaster',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B1020),
        useMaterial3: true,
      ),
      // ✅ Start with SplashScreen
      home: const SplashScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return _fadeRoute(const HomeScreen(), settings);
          case '/lesson':
            return _slideRoute(const LessonOverviewScreen(), settings);
          case '/quiz':
            return _slideRoute(const QuizScreen(), settings);
          case '/quizHistory':
            return _fadeRoute(const QuizHistoryScreen(), settings);
          case '/level':
            return _slideRoute(const LevelScreen(), settings);
          case '/progress':
            return _fadeRoute(const ProgressScreen(), settings);
          case '/languageDetail':
            final args = settings.arguments as String;
            return _slideRoute(LanguageDetailScreen(language: args), settings);
          default:
            return null;
        }
      },
    );
  }

  // Fade Transition
  PageRouteBuilder _fadeRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, _, _) => page,
      transitionsBuilder: (_, animation, _, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  // Slide Transition
  PageRouteBuilder _slideRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, _, _) => page,
      transitionsBuilder: (_, animation, _, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
