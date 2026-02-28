import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // مشغل الصوت للنسخة المحسنة 1.1
  final AudioPlayer _audioPlayer = AudioPlayer();

  // تخزين إجابات المستخدم (مصفوفة من 5 عناصر فارغة في البداية)
  final List<String?> _userAnswers = [null, null, null, null, null];
  bool _isSubmitted = false;
  int _score = 0;

  // الأسئلة والخيارات والإجابات الصحيحة
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'أي مدينة تُعرف بالمدينة الوردية؟',
      'options': ['جرش (A', 'العقبة (B', 'البترا (C'],
      'answer': 'البترا (C',
    },
    {
      'question': 'أي موقع يُعرف باسم وادي القمر؟',
      'options': ['جبل نيبو (A', 'وادي رم (B', 'عجلون (C'],
      'answer': 'وادي رم (B',
    },
    {
      'question': 'في أي مدينة توجد آثار رومانية شهيرة؟',
      'options': ['البترا (A', 'العقبة (B', 'جرش (C'],
      'answer': 'جرش (C',
    },
    {
      'question': 'أي موقع يتميز بإطلالة رائعة على البحر الميت؟',
      'options': ['جرش (A', 'قلعة عجلون (B', 'جبل نيبو (C'],
      'answer': 'جبل نيبو (C',
    },
    {
      'question': 'أي قلعة بُنيت في القرن الثاني عشر لأغراض دفاعية؟',
      'options': ['جرش (A', 'قلعة عجلون (B', 'البترا (C'],
      'answer': 'قلعة عجلون (B',
    },
  ];

  // دالة حساب النتيجة
  void _calculateScore() {
    _score = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_userAnswers[i] == _questions[i]['answer']) {
        _score++;
      }
    }
  }

  // نافذة التأكيد قبل الإرسال
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFFF3EAE0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.help_outline, size: 80, color: Color(0xFFC19A6B)),
            const SizedBox(height: 20),
            const Text(
              'هل أنت متأكد من إرسال الإجابات؟',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'لن تتمكن من تعديل إجاباتك بعد الإرسال!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
                setState(() {
                  _calculateScore();
                  _isSubmitted = true;
                });
                
                // تشغيل صوت التصفيق عند اجتياز الاختبار بنجاح مبهر (4 أو 5)
                if (_score >= 4) {
                  try {
                    _audioPlayer.play(AssetSource('audio/cheer.mp3'));
                    // إيقاف الصوت بعد 3 ثواني
                    Future.delayed(const Duration(seconds: 3), () {
                      _audioPlayer.stop();
                    });
                  } catch (e) {
                    // تجاهل الخطأ في حال لم يتم رفع ملف الصوت بعد
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD4C4B7),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text('إرسال', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('العودة إلى صفحة الاختبار', style: TextStyle(color: Colors.black54)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Tourism Quiz',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B6B43),
              ),
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            // إنشاء قائمة الأسئلة بشكل ديناميكي
            ...List.generate(_questions.length, (index) {
              final q = _questions[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
              // تحسين طريقة عرض السؤال بناءً على الملاحظات
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3EAE0), // لون خلفية هادئ
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: const Color(0xFFC19A6B), width: 1.5),
                ),
                child: Text(
                  q['question'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                    height: 1.4,
                  ),
                ),
              ),
                    const SizedBox(height: 10),
                    ...q['options'].map<Widget>((option) {
                      bool isCorrectAnswer = option == q['answer'];
                      bool isUserSelected = _userAnswers[index] == option;

                      // تغيير الألوان بعد الإرسال لبيان الصح والخطأ
                      Color? textColor;
                      if (_isSubmitted) {
                        if (isCorrectAnswer) textColor = Colors.green;
                        else if (isUserSelected && !isCorrectAnswer) textColor = Colors.red;
                      }

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(option, style: TextStyle(color: textColor ?? Colors.black87)),
                          Radio<String>(
                            value: option,
                            groupValue: _userAnswers[index],
                            activeColor: _isSubmitted 
                                ? (isCorrectAnswer ? Colors.green : Colors.red) 
                                : const Color(0xFF2C3E50),
                            onChanged: _isSubmitted ? null : (val) {
                              setState(() {
                                _userAnswers[index] = val;
                              });
                            },
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              );
            }),
            
            // زر الإرسال أو مربع النتيجة
            if (!_isSubmitted)
              ElevatedButton(
                onPressed: _userAnswers.contains(null) ? null : _showConfirmationDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4C4B7),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text('إرسال', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              )
            else
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5D5C1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      _score >= 3 ? '🎉 Excellent Performance!' : '😕 Not Quite Right!',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$_score/5',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TextButton.icon(
                      icon: const Icon(Icons.refresh, color: Colors.black54),
                      label: const Text('Try again to improve your score', style: TextStyle(color: Colors.black54)),
                      onPressed: () {
                        setState(() {
                          _isSubmitted = false;
                          for(int i=0; i<_userAnswers.length; i++) {
                            _userAnswers[i] = null;
                          }
                        });
                      },
                    )
                  ],
                ),
              ),
            const SizedBox(height: 30),
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
