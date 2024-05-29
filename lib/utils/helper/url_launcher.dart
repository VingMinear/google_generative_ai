import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'alerting.dart';
// config ios
// <key>LSApplicationQueriesSchemes</key>
// <array>
//   <string>sms</string>
//   <string>tel</string>
// </array>

//----------prefix---------------
// url > https:
// email to > mailto:
// call > tel:
// message > sms:
Future<void> callLaunchUrl({
  required String url,
  required LaunchMode mode,
  WebViewConfiguration? webViewConfiguration,
}) async {
  try {
    if (!await launchUrl(
      Uri.parse(url),
      mode: mode,
    )) {
      debugPrint('Could not launch : $url');
      throw 'Could not launch $url';
    }
  } on Exception catch (e) {
    alertErrorSnackbar(
      title: "Error",
      message: "Could not launch $url",
    );
    debugPrint('Erorr: $e');
  }
}
