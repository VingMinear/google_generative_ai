import 'package:flutter/material.dart';
import 'package:get/get.dart';

// enum ThemeModeType { light, dark }

class ThemeConTroller extends GetxController {
  ThemeMode? _themeMode;
  ThemeMode? get themeMode => _themeMode;
  var onLogTap = false;
  var switcher = true;
  // bool get isDarkTheme => theme.value == ThemeMode.dark;
  void toggleTheme() async {
    debugPrint("swaping");
    onLogTap = false;
    if (_themeMode == ThemeMode.light) {
      switcher = false;
      _themeMode = ThemeMode.dark;
    } else {
      switcher = true;
      _themeMode = ThemeMode.light;
    }
    // theme(_themeMode!);
    update();
    debugPrint(" Theme Store : $themeMode");
  }

  void getTheme() {
    debugPrint("My Thmeme : ${Get.theme}");
  }
}
