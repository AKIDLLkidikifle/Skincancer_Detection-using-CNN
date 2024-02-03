import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import './home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      
      logoWidth: 100,
      title: const Text(
        "Skin App",
        style: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
      ),
      logo: Image.asset('assets/icons.jpg'),
      // logoSize: 130,
      backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loadingText: const Text("Loading..."),
      navigator: const Home(),
      durationInSeconds: 5,
    );
  }
}
