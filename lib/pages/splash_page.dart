import 'package:flutter/material.dart';
import 'package:uzum_clone/components/constants/image.dart';
import 'package:uzum_clone/pages/home/tab/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const MainPage()),
            (route) => false));
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.logo,
          width: 120,
        ),
      ),
    );
  }
}
