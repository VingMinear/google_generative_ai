import 'package:flutter/material.dart';

AppBar primaryAppBar({
  required String text,
  List<Widget>? actions,
  double? elevation,
  Color? backgroundColor,
  Color? foregroundColor,
  double? toolbarHeight,
  double? leadingWidth,
  bool automaticallyImplyLeading = true,
  double spaceLeft = 10,
  Widget? leading,
}) {
  return AppBar(
    leading: leading,
    automaticallyImplyLeading: automaticallyImplyLeading,
    toolbarHeight: toolbarHeight,
    leadingWidth: leadingWidth,
    foregroundColor: foregroundColor,
    elevation: elevation,
    backgroundColor: backgroundColor,
    title: Text(text),
    actions: [
      if (actions != null) ...{
        ...actions.map((e) {
          return e;
        }).toList(),
        SizedBox(width: spaceLeft),
      },
    ],
  );
}
