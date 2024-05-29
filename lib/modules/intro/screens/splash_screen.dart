import 'dart:async';

import 'package:ai_app/style/app_color.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../home/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 4200), () {
      Get.offAll(() {
        return HomeScreen();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SplashScreenProvider().fetchData(context);
    return Scaffold(
      backgroundColor: AppColor.primaryLightColor,
      body: Padding(
        padding: const EdgeInsets.all(20).copyWith(
          top: context.width / 4,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/lotties/brain.json",
                onLoaded: (p0) {},
              ),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30,
                  color: AppColor.darkColor,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    FlickerAnimatedText(
                      "Welcome",
                      speed: const Duration(milliseconds: 600),
                    ),
                    FlickerAnimatedText(
                      "to",
                      speed: const Duration(milliseconds: 200),
                    ),
                    FlickerAnimatedText(
                      "Chat GPT",
                      speed: const Duration(milliseconds: 600),
                    ),
                  ],
                  repeatForever: true,
                ),
              ),
              const Spacer(),
              const Text("Copyright© N E A"),
            ],
          ),
        ),
      ),
    );
  }
}
