import 'dart:async';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _scaleAnimation;

  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1020),

      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,

          child: ScaleTransition(
            scale: _scaleAnimation,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  width: 140,
                  height: 140,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),

                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF8B5CF6).withValues(alpha: .35),
                        blurRadius: 35,
                      ),
                    ],
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),

                    child: Image.asset(
                      "assets/icon/app_icon.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                const Text(
                  "LingoMaster",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Master Languages Easily",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),

                const SizedBox(height: 45),

                const SizedBox(
                  width: 28,
                  height: 28,

                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Color(0xFF00D4FF),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
