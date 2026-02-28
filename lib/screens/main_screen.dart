import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'attractions_screen.dart';
import 'quiz_screen.dart';
import 'rating_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // متغير بسيط لحفظ رقم الصفحة الحالية
  int _currentIndex = 0;

  // قائمة بجميع الصفحات التي سيتم التنقل بينها
  final List<Widget> _pages = [
    const HomeScreen(),
    const AttractionsScreen(),
    const QuizScreen(),
    const RatingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jordan Explorer'),
      ),
      // نعرض الصفحة الحالية بناءً على الاختيار
      body: _pages[_currentIndex],
      // شريط التنقل السفلي
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // لتغيير الصفحة وإعادة بناء الواجهة
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // لإظهار كل العناصر بشكل ثابت
        selectedItemColor: const Color(0xFF8B6B43), // لون العنصر المحدد (بني غامق)
        unselectedItemColor: Colors.grey, // لون العناصر غير المحددة
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: 'المعالم',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'الاختبار',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'التقييم',
          ),
        ],
      ),
    );
  }
}
