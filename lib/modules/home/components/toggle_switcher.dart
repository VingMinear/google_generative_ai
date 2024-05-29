import 'package:ai_app/style/controller/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToggleSwitcher extends StatefulWidget {
  const ToggleSwitcher({super.key});

  @override
  State<ToggleSwitcher> createState() => _ToggleSwitcherState();
}

class _ToggleSwitcherState extends State<ToggleSwitcher> {
  // true = ligth & false= dark

  var width = 65.0;
  var height = 33.0;
  var darkGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    transform: GradientRotation(-0.2),
    colors: [
      Color(0xff202063),
      Color(0xff494577),
    ],
  );
  var lightGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    transform: const GradientRotation(-0.6),
    colors: [
      const Color(0xff65D5F3),
      const Color(0xffBDEEF5).withOpacity(0.6),
    ],
  );
  var duration = const Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeConTroller>(
      builder: (con) => GestureDetector(
        onTap: () {
          con.toggleTheme();
        },
        onLongPressDown: (_) {
          con.onLogTap = true;
          con.update();
        },
        onLongPressUp: () {
          con.toggleTheme();
        },
        child: AnimatedContainer(
          width: width,
          height: height,
          duration: duration,
          decoration: BoxDecoration(
            gradient: con.switcher ? lightGradient : darkGradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: con.switcher ? Colors.blue : Colors.yellow,
                  blurRadius: 3,
                  spreadRadius: -1),
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: AnimatedOpacity(
                  opacity: con.switcher ? 0 : 1,
                  duration: duration,
                  child: Image.asset("assets/images/stars.png"),
                ),
              ),
              Positioned(
                right: 8,
                bottom: 0,
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: AnimatedOpacity(
                    opacity: con.switcher ? 1 : 0,
                    duration: duration,
                    child: Image.asset("assets/images/clouds.png"),
                  ),
                ),
              ),
              AnimatedAlign(
                alignment: con.onLogTap
                    ? Alignment.center
                    : con.switcher
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                curve: Curves.fastOutSlowIn,
                duration: duration,
                child: AnimatedCrossFade(
                  duration: duration,
                  firstChild: icon("assets/images/sun.png"),
                  secondChild: icon("assets/images/moon.png"),
                  crossFadeState: con.switcher
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container icon(String asset) {
    var size = height / 0.9;
    return Container(
      width: size,
      decoration: BoxDecoration(
        // color: Colors.amber,
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
