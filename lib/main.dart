import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const JordanExplorerApp());
}

class JordanExplorerApp extends StatelessWidget {
  const JordanExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // تخصيص الألوان لتتناسب مع الهوية السياحية الأردنية (ألوان الصحراء والآثار)
    return MaterialApp(
      title: 'Jordan Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC19A6B), // لون قريب من الرمل/الصحراء
          background: const Color(0xFFF0EBE1), // لون خلفية مريح للنظر
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE5D5C1),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFF4A4A4A),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
