import 'package:flutter/material.dart';

class AttractionDetailsScreen extends StatefulWidget {
  final String attractionId;

  const AttractionDetailsScreen({super.key, required this.attractionId});

  @override
  State<AttractionDetailsScreen> createState() => _AttractionDetailsScreenState();
}

class _AttractionDetailsScreenState extends State<AttractionDetailsScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = _getAttractionData(widget.attractionId);
    final List<String> images = [data['image1']!, data['image2']!];

    return Scaffold(
      backgroundColor: const Color(0xFFFAF6F2),
      appBar: AppBar(
        title: const Text('Jordan Explorer', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color(0xFF2C3E50),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // تصميم معرض الصور (Slider) للحفاظ على الأبعاد الحقيقية كاملة بدون قص
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 400, // ارتفاع متناسق يناسب جميع أبعاد الصور
                  width: double.infinity,
                  color: const Color(0xFF0F1522), // خلفية داكنة جداً تبرز الصور كمعرض احترافي
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        images[index],
                        fit: BoxFit.contain, // أهم شيء: إظهار الصورة بالكامل بدون أي قص
                      );
                    },
                  ),
                ),
                
                // سهم الرجوع
                if (_currentIndex > 0)
                  Positioned(
                    left: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.5),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
                        onPressed: () {
                          _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                        },
                      ),
                    ),
                  ),
                  
                // سهم التقدم
                if (_currentIndex < images.length - 1)
                  Positioned(
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.5),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20),
                        onPressed: () {
                          _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                        },
                      ),
                    ),
                  ),
                  
                // نقاط تدل على عدد الصور (Indicators)
                Positioned(
                  bottom: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(images.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentIndex == index ? 12 : 8,
                        height: _currentIndex == index ? 12 : 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index ? const Color(0xFFC19A6B) : Colors.white54,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            
            // محتوى تفاصيل المدينة
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    data['title']!,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B6B43),
                    ),
                  ),
                  const SizedBox(height: 25),
                  // بطاقة النص التعريفي
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 15,
                          spreadRadius: 2,
                          offset: const Offset(0, 5),
                        )
                      ],
                      border: Border.all(color: const Color(0xFFC19A6B).withOpacity(0.3), width: 1.5),
                    ),
                    child: Text(
                      data['description']!,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.8,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // الدالة التي تحتوي على نصوص وصور كل منطقة
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
          'description': 'وادي القمر وادي رم واحدة من أجمل الصحاري وتقع جنوب الأردن تتميز بصخورها الضخمة ومناظرها الطبيعية ورمالها الحمراء. عرف وادي رم باسم وادي القمر بسبب طبيعته التي تشبه سطح القمر. يشتهر وادي رم برحلات التخييم والسفاري.',
        };
      case 'nebo':
        return {
          'title': 'Mount Nebo',
          'image1': 'assets/images/8.jpeg',
          'image2': 'assets/images/10.jpeg',
          'description': 'جبل نيبو يعد موقع تاريخي ديني قديم ويقع في غرب الأردن، يعتقد جبل نيبو أنه المكان الذي وقف فيه النبي موسى عليه السلام قبل وفاته. يشتهر الجبل أيضاً بإطلالتها على البحر الميت ووادي الأردن.',
        };
      case 'ajloun':
        return {
          'title': 'Ajloun Castle',
          'image1': 'assets/images/7.jpeg',
          'image2': 'assets/images/5.jpeg',
          'description': 'قلعة عجلون تعد قلعة تاريخية إسلامية تقع في شمال الأردن بنيت في القرن الثاني عشر لهدف حماية المنطقة من الحملات الصليبية. تتميز القلعة بموقعها المرتفع وإطلالتها على المناطق المحيطة.',
        };
      default:
        return {
          'title': 'Unknown',
          'image1': '',
          'image2': '',
          'description': '',
        };
    }
  }
}
