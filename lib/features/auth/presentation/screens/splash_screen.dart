import 'package:flutter/material.dart';
import 'package:taxxons/core/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Splash screen usually has a delay or waits for initialization
    // But since the router handles guards, we just show it briefly if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.headerBg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/headText.jpg', width: 300),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
