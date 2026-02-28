import 'package:flutter/material.dart';
import 'video_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // تصميم الشعار (Logo) مبني برمجياً ليطابق التصميم المرفق تماماً
              Container(
                width: 320,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFFFAF6F2), // لون بيج فاتح مطابق للبطاقة
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // صورة البتراء في الخلفية باهتة جداً (Watermark)
                      Opacity(
                        opacity: 0.15,
                        child: Image.asset(
                          'assets/images/3.jpeg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // محتويات الشعار (شكل القوس والنص)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // شكل القوس (مبني بالأشكال الهندسية)
                          Column(
                            children: [
                              Container(
                                width: 55,
                                height: 50,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Color(0xFFD3BCA4), width: 14),
                                    left: BorderSide(color: Color(0xFFD3BCA4), width: 14),
                                    right: BorderSide(color: Color(0xFFD3BCA4), width: 14),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(28),
                                    topRight: Radius.circular(28),
                                  ),
                                ),
                              ),
                              // قاعدة القوس الممتدة قليلاً
                              Container(
                                width: 85,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD3BCA4),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // اسم التطبيق Jordan Explorer
                          const Text(
                            'Jordan Explorer',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFFA69076), // لون بني فاتح متناسق
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Times New Roman', // خط كلاسيكي مشابه للصورة
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // النص التعريفي الأساسي للتطبيق
              const Text(
                'يعرض تطبيق Jordan Explorer\nأشهر المعالم السياحية في الأردن\nبطريقة تفاعلية وسهلة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18, 
                  color: Colors.black87, 
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 50),
              // نص تشجيعي
              const Text(
                'اكتشف الأردن بطريقة جديدة',
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              // زر مشاهدة الفيديو
              ElevatedButton.icon(
                onPressed: () {
                  // فتح شاشة عرض الفيديو
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VideoScreen()),
                  );
                },
                // أيقونة الزر
                icon: const Icon(Icons.play_circle_fill, color: Colors.white),
                // نص الزر
                label: const Text(
                  'Watch Intro Video',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C3E50), // لون أزرق غامق كما في التصميم
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
