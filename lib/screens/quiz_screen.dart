import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  String? answer5;
  bool done = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    if (done) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('نتيجتك: $score / 5',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(score >= 3 ? '🎉 ممتاز!' : '😕 حاول مجدداً',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  done = false;
                  score = 0;
                  answer1 = answer2 = answer3 = answer4 = answer5 = null;
                });
              },
              child: const Text('إعادة الاختبار'),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // السؤال 1
          const Text('السؤال 1: أي مدينة تُعرف بالمدينة الوردية؟',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          RadioListTile(title: const Text('جرش'), value: 'جرش',
              groupValue: answer1, onChanged: (v) => setState(() => answer1 = 'جرش')),
          RadioListTile(title: const Text('العقبة'), value: 'العقبة',
              groupValue: answer1, onChanged: (v) => setState(() => answer1 = 'العقبة')),
          RadioListTile(title: const Text('البترا'), value: 'البترا',
              groupValue: answer1, onChanged: (v) => setState(() => answer1 = 'البترا')),

          const Divider(),

          // السؤال 2
          const Text('السؤال 2: أي موقع يُعرف باسم وادي القمر؟',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          RadioListTile(title: const Text('جبل نيبو'), value: 'جبل نيبو',
              groupValue: answer2, onChanged: (v) => setState(() => answer2 = 'جبل نيبو')),
          RadioListTile(title: const Text('وادي رم'), value: 'وادي رم',
              groupValue: answer2, onChanged: (v) => setState(() => answer2 = 'وادي رم')),
          RadioListTile(title: const Text('عجلون'), value: 'عجلون',
              groupValue: answer2, onChanged: (v) => setState(() => answer2 = 'عجلون')),

          const Divider(),

          // السؤال 3
          const Text('السؤال 3: في أي مدينة توجد آثار رومانية شهيرة؟',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          RadioListTile(title: const Text('البترا'), value: 'البترا',
              groupValue: answer3, onChanged: (v) => setState(() => answer3 = 'البترا')),
          RadioListTile(title: const Text('العقبة'), value: 'العقبة',
              groupValue: answer3, onChanged: (v) => setState(() => answer3 = 'العقبة')),
          RadioListTile(title: const Text('جرش'), value: 'جرش',
              groupValue: answer3, onChanged: (v) => setState(() => answer3 = 'جرش')),

          const Divider(),

          // السؤال 4
          const Text('السؤال 4: أي موقع يتميز بإطلالة على البحر الميت؟',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          RadioListTile(title: const Text('جرش'), value: 'جرش',
              groupValue: answer4, onChanged: (v) => setState(() => answer4 = 'جرش')),
          RadioListTile(title: const Text('قلعة عجلون'), value: 'قلعة عجلون',
              groupValue: answer4, onChanged: (v) => setState(() => answer4 = 'قلعة عجلون')),
          RadioListTile(title: const Text('جبل نيبو'), value: 'جبل نيبو',
              groupValue: answer4, onChanged: (v) => setState(() => answer4 = 'جبل نيبو')),

          const Divider(),

          // السؤال 5
          const Text('السؤال 5: أي قلعة بُنيت في القرن الثاني عشر؟',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          RadioListTile(title: const Text('جرش'), value: 'جرش',
              groupValue: answer5, onChanged: (v) => setState(() => answer5 = 'جرش')),
          RadioListTile(title: const Text('قلعة عجلون'), value: 'قلعة عجلون',
              groupValue: answer5, onChanged: (v) => setState(() => answer5 = 'قلعة عجلون')),
          RadioListTile(title: const Text('البترا'), value: 'البترا',
              groupValue: answer5, onChanged: (v) => setState(() => answer5 = 'البترا')),

          const SizedBox(height: 20),

          Center(
            child: ElevatedButton(
              onPressed: () {
                if (answer1 == null || answer2 == null || answer3 == null ||
                    answer4 == null || answer5 == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('أجب على جميع الأسئلة أولاً')));
                } else {
                  int s = 0;
                  if (answer1 == 'البترا') s++;
                  if (answer2 == 'وادي رم') s++;
                  if (answer3 == 'جرش') s++;
                  if (answer4 == 'جبل نيبو') s++;
                  if (answer5 == 'قلعة عجلون') s++;
                  setState(() { score = s; done = true; });
                }
              },
              child: const Text('إرسال الإجابات'),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
