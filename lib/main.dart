import 'package:flutter/material.dart';
import 'package:praktpm2tugas/loginpage2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Demo', home: Loginpage2());
  }
}
