import 'package:flutter/material.dart';

// شاشة تفاصيل المعلم السياحي
class AttractionDetailsScreen extends StatelessWidget {
  final String attractionId;

  const AttractionDetailsScreen({super.key, required this.attractionId});

  @override
  Widget build(BuildContext context) {
    final data = _getAttractionData(attractionId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jordan Explorer'),
        backgroundColor: const Color(0xFF2C3E50),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // الصورة الأولى
            Image.asset(
              data['image1']!,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            // الصورة الثانية
            Image.asset(
              data['image2']!,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
            // المحتوى النصي
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    data['title']!,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B6B43),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    data['description']!,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 16, height: 1.7),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // بيانات كل معلم
  Map<String, String> _getAttractionData(String id) {
    switch (id) {
      case 'petra':
        return {
          'title': 'Petra',
          'image1': 'assets/images/1.jpeg',
          'image2': 'assets/images/3.jpeg',
          'description': 'المدينة الوردية البتراء من عجائب الدنيا السبعة وهي من أهم المواقع الأثرية في الأردن. بنيت البتراء على يد الأنباط من أكثر من 2000 عام. اشتهرت البتراء بنحتها وعمارتها ونظامها الخاص بتجميع المياه. واشتهرت أيضاً بلون صخورها الوردية لذا قد عرفت باسم المدينة الوردية.',
        };
      case 'jerash':
        return {
          'title': 'Jerash',
          'image1': 'assets/images/4.jpeg',
          'image2': 'assets/images/15.jpeg',
          'description': 'جرش مدينة أثرية تقع في شمال الأردن وتعد من أجمل وأفضل المدن المحفوظة الرومانية في العالم. تتميز جرش بشوارعها وأعمدتها والمسارح والمعابد التي تعكس جمال الحضارة الرومانية.',
        };
      case 'wadirum':
        return {
          'title': 'Wadi Rum',
          'image1': 'assets/images/6.jpeg',
          'image2': 'assets/images/11.jpeg',
          'description': 'وادي رم واحدة من أجمل الصحاري وتقع جنوب الأردن. تتميز بصخورها الضخمة ومناظرها الطبيعية ورمالها الحمراء. عرف وادي رم باسم وادي القمر بسبب طبيعته التي تشبه سطح القمر.',
        };
      case 'nebo':
        return {
          'title': 'Mount Nebo',
          'image1': 'assets/images/8.jpeg',
          'image2': 'assets/images/10.jpeg',
          'description': 'جبل نيبو موقع تاريخي ديني قديم يقع في غرب الأردن. يعتقد أنه المكان الذي وقف فيه النبي موسى عليه السلام قبل وفاته. يشتهر الجبل بإطلالته على البحر الميت ووادي الأردن.',
        };
      case 'ajloun':
        return {
          'title': 'Ajloun Castle',
          'image1': 'assets/images/7.jpeg',
          'image2': 'assets/images/5.jpeg',
          'description': 'قلعة عجلون قلعة تاريخية إسلامية تقع في شمال الأردن. بنيت في القرن الثاني عشر لحماية المنطقة من الحملات الصليبية. تتميز القلعة بموقعها المرتفع وإطلالتها على المناطق المحيطة.',
        };
      default:
        return {'title': 'Unknown', 'image1': '', 'image2': '', 'description': ''};
    }
  }
}
