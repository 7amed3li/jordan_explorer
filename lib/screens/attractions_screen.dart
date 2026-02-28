import 'package:flutter/material.dart';
import 'attraction_details_screen.dart';

class AttractionsScreen extends StatelessWidget {
  const AttractionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة المعالم لسهولة إنشائها برمجياً بحلقة تكرار (Loop)
    final List<Map<String, String>> attractions = [
      {'name': 'Petra', 'image': 'assets/images/3.jpeg', 'id': 'petra'},
      {'name': 'Jerash', 'image': 'assets/images/4.jpeg', 'id': 'jerash'},
      {'name': 'Wadi\nRum', 'image': 'assets/images/6.jpeg', 'id': 'wadirum'},
      {'name': 'Mount\nNebo', 'image': 'assets/images/8.jpeg', 'id': 'nebo'},
      {'name': 'Ajloun\nCastle', 'image': 'assets/images/5.jpeg', 'id': 'ajloun'},
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Tourist Attractions in Jordan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B6B43),
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'تتيح لك هذه الصفحة التعرف على أبرز المناطق السياحية في الأردن. يمكنك الضغط على الزر الخاص بكل منطقة للاطلاع على معلوماتها. تاريخها، وأهم ما يميزها من معالم جميلة. اختر المنطقة التي ترغب بمعرفتها واستكشف تفاصيلها بسهولة',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 15, height: 1.5, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            // عرض المعالم في شكل شبكة (Grid) أو صفوف
            Wrap(
              spacing: 15,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: attractions.map((attraction) => _buildAttractionButton(context, attraction)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // دالة صغيرة لبناء زر كل معلم لتجنب تكرار الكود
  Widget _buildAttractionButton(BuildContext context, Map<String, String> data) {
    return InkWell(
      onTap: () {
        // الانتقال لصفحة التفاصيل عند الضغط
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AttractionDetailsScreen(attractionId: data['id']!),
          ),
        );
      },
      child: Container(
        width: 160,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF1E2638), // لون أزرق داكن
          borderRadius: BorderRadius.circular(35),
          boxShadow: const [
            BoxShadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 4),
          ]
        ),
        // قَص المحتوى الزائد حتى تأخذ الصورة شكل الزاوية الدائرية من اليمين
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  data['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // تعديل الأبعاد لتظهر الصورة بشكل أوسع ولا تُقص كثيراً (بناءً على التقييم)
            SizedBox(
              width: 80,
              height: 70,
              child: Image.asset(
                data['image']!,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) => const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
