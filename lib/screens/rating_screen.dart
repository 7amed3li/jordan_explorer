import 'package:flutter/material.dart';

// شاشة التقييم
class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _rating = 0;
  bool _isSubmitted = false;
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // شاشة الشكر بعد الإرسال
    if (_isSubmitted) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Thank You for Your Feedback',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF8B6B43),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'نقدّر ملاحظاتك وآراءك.\nيساعدنا تقييمك على تطوير التطبيق.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isSubmitted = false;
                  _rating = 0;
                  _commentController.clear();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE5D5C1),
              ),
              child: const Text('العودة', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      );
    }

    // شاشة التقييم
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const Text(
              'User Feedback',
              style: TextStyle(
                fontSize: 22,
                color: Color(0xFF8B6B43),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 30),
            const Text('How would you rate our app?', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            // النجوم التفاعلية
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    size: 40,
                    color: const Color(0xFFD4AF37),
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
            // حقل التعليق
            TextField(
              controller: _commentController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'اكتب تعليقك هنا',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 30),
            // زر الإرسال
            ElevatedButton(
              onPressed: _rating == 0
                  ? null
                  : () {
                      setState(() {
                        _isSubmitted = true;
                      });
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD4C4B7),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text('إرسال', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
