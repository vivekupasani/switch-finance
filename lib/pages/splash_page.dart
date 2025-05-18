import 'package:flutter/material.dart';
import 'package:scrip/pages/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      navigateToMainPage();
    });
  }

  void navigateToMainPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'splash',
      child: Scaffold(
        body: Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            color: [const Color.fromARGB(255, 11, 11, 11), Colors.white][0],
            child: Center(
              child: Text(
                "switch",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 58,
                  shadows: [
                    Shadow(
                      color: const Color.fromARGB(60, 173, 92, 92),
                      offset: const Offset(5, 2),
                      blurRadius: 50.0,
                    ),
                    Shadow(
                      color: const Color.fromARGB(59, 74, 60, 60),
                      offset: const Offset(-5, 2),
                      blurRadius: 50.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
