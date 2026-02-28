import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer(); // مشغل الصوت للنسخة 1.1
  int _rating = 0;
  bool _isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    if (_isSubmitted) {
      // شاشة الشكر بعد التقييم
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
            const SizedBox(height: 30),
            const Text(
              'We appreciate your feedback.\nYour opinion helps us improve our app.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),
            const Text(
              'نقدّر ملاحظاتك وآراءك.\nيساعدنا تقييمك على تطوير التطبيق\nوتحسين تجربتك.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.favorite_border, size: 40, color: Colors.black54),
              )),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isSubmitted = false;
                  _rating = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE5D5C1),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('العودة إلى الصفحة الرئيسية', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      );
    }

    // شاشة التقييم المبدئية
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
            const Text(
              'How would you rate',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // النجوم التفاعلية
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    size: 40,
                    color: const Color(0xFFD4AF37), // لون ذهبي للنجوم
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 40),
            // مربع النص للرأي
            TextField(
              textAlign: TextAlign.right,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: '... اكتب رأيك هنا',
                filled: true,
                fillColor: const Color(0xFFE5D5C1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: const Icon(Icons.edit, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 50),
            // زر الإرسال
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: InkWell(
                onTap: () {
                  if (_rating > 0) {
                    setState(() {
                      _isSubmitted = true;
                    });
                    
                    // تشغيل صوت التصفيق عند تقييم 4 أو 5 نجوم
                    if (_rating >= 4) {
                      try {
                        _audioPlayer.play(AssetSource('audio/clap.mp3'));
                        // إيقاف الصوت بعد 3 ثواني فقط
                        Future.delayed(const Duration(seconds: 3), () {
                          _audioPlayer.stop();
                        });
                      } catch (e) {
                        // تجاهل في حالة عدم وجود الملف بعد
                      }
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('الرجاء اختيار التقييم بالنجوم أولاً')),
                    );
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.send, color: Colors.black54),
                    SizedBox(width: 10),
                    Text(
                      '[ إرسال التقييم ]',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
