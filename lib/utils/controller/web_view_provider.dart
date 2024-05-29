import 'package:flutter/material.dart';

class WebViewProvider extends ChangeNotifier {
  var isWebLoading = false;

  webLoading(bool loading) {
    isWebLoading = loading;
    notifyListeners();
  }
}
