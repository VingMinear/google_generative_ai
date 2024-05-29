import 'package:flutter/material.dart';

class InternetNoConnectionScreen extends StatelessWidget {
  const InternetNoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("No connection !"),
      ),
    );
  }
}
