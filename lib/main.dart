import 'package:ai_app/modules/intro/screens/splash_screen.dart';
import 'package:ai_app/style/controller/theme_provider.dart';
import 'package:ai_app/style/theme.dart';
import 'package:ai_app/utils/helper/api_base_helper.dart';
import 'package:ai_app/utils/helper/local_storage.dart';
import 'package:ai_app/utils/view/dismiss_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import 'utils/controller/global_key.dart';
import 'utils/helper/network_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  // if i put here it not working
  // ThemeProvider().getTheme();
  var token = LocalStorage.getStringData(key: "token");

  if (token.isNotEmpty) {
    ApiBaseHelper().token = token;
    debugPrint("token > $token");
  }

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetBuilder<ThemeConTroller>(
        init: ThemeConTroller(),
        builder: (con) => GetMaterialApp(
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: con.themeMode ?? ThemeMode.system,
          initialBinding: NetworkBinding(),
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: snackBarKey,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
