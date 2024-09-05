import 'package:flutter/material.dart';
import 'package:gpa/HomeScreen.dart';
import 'package:gpa/gpaScreen.dart';
import 'package:gpa/agpaScreen.dart';
import 'package:gpa/loadingScreen.dart';

void main() {
  runApp(MaterialApp(
    builder: (context, child) {
      return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!);
    },
    debugShowCheckedModeBanner: false,
    title: "GPA",
    initialRoute: LoadingScreen.id,
    routes: {
      HomeScreen.id: (context) => const HomeScreen(),
      GpaScreen.id: (context) => const GpaScreen(),
      AGpaScreen.id: (context) => const AGpaScreen(),
      LoadingScreen.id: (context) => LoadingScreen(context),
    },
  ));
}
