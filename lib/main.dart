import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: boxDecorationOfContainer(),
          child: const StartScreen(),
        ), //ContainerColored(),
      ),
    ),
  );
}

BoxDecoration boxDecorationOfContainer() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.blue, Colors.red],
    ),
  );
}
