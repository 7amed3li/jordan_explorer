import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// هذي النقطة اللي يبدأ منها البرنامج يشتغل، زي مفتاح السيارة!
void main() {
  // هنا نقول للتطبيق "توكل على الله واشتغل" ونعطيه اسم التطبيق الرئيسي
  runApp(const JordanExplorerApp());
}

// هذا الكلاس (Class) هو القالب الأساسي للتطبيق، وهو ثابت (Stateless) يعني ما يتغير شكله من نفسه
class JordanExplorerApp extends StatelessWidget {
  const JordanExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp هو الغلاف حق التطبيق، يعطينا خصائص زي الألوان والتصميم والخطوط
    return MaterialApp(
      title: 'Jordan Explorer', // اسم التطبيق المخفي (يطلع لما تصغر التطبيق)
      debugShowCheckedModeBanner: false, // هذي عشان نشيل الشريط الأحمر المزعج اللي مكتوب عليه "Debug" في الزاوية
      theme: ThemeData(
        // هنا نضبط الألوان الأساسية للتطبيق
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC19A6B), // لون أساسي يشبه لون رمل الصحراء (عشان الهوية الأردنية)
          surface: const Color(0xFFF0EBE1), // لون الخلفية فاتح ومريح للعين
        ),
        useMaterial3: true, // نستخدم أحدث أسلوب تصميم من جوجل (Material 3)
        appBarTheme: const AppBarTheme(
          // هنا نضبط شكل الشريط العلوي (اللي يجي فوق في كل شاشة)
          backgroundColor: Color(0xFFE5D5C1), // لونه بيج فاتح
          centerTitle: true, // نخلي العنوان يجي في النص بدل ما يكون عاليسار
          titleTextStyle: TextStyle(
            color: Color(0xFF4A4A4A), // لون النص رمادي غامق
            fontSize: 22, // حجم الخط
            fontWeight: FontWeight.bold, // الخط عريض (غامق)
          ),
        ),
      ),
      // هذي الصفحة الرئيسية اللي بتفتح أول ما يشتغل التطبيق
      home: const MainScreen(),
    );
  }
}

// هذي صفحة الـ MainScreen، وهي "متغيرة" (Stateful) لأننا بنبدل بين الصفحات اللي تحتها
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // متغير بسيط يحفظ إحنا في أي صفحة الحين (0 يعني الصفحة الأولى، 1 الثانية، وهكذا...)
  int _currentIndex = 0;

  // هذي قائمة (لستة) حطينا فيها كل الصفحات اللي بنتنقل بينها
  final List<Widget> _pages = [
    const HomeScreen(), // الصفحة الأولى (رقم 0) - الصفحة الترحيبية
    const AttractionsScreen(), // الصفحة الثانية (رقم 1) - قائمة المعالم
    const QuizScreen(), // الصفحة الثالثة (رقم 2) - الاختبار
    const RatingScreen(), // الصفحة الرابعة (رقم 3) - التقييم
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold هو الهيكل العظمي للشاشة (سقف، وجسم، وأرضية)
    return Scaffold(
      // السقف (الشريط العلوي)
      appBar: AppBar(
        title: const Text('Jordan Explorer'), // عنوان التطبيق اللي بيظهر فوق
      ),
      // الجسم: هنا نعرض الصفحة المحددة بناءً على الرقم اللي في المتغير _currentIndex
      body: _pages[_currentIndex],
      // الأرضية: شريط التنقل السفلي اللي فيه الأيقونات
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // نقول للشريط: ترى إحنا الحين في هذي الصفحة، عشان يضوي أيقونتها
        onTap: (index) {
          // هذي الدالة (setState) سحرية! لما نضغط أي أيقونة تحت، تغيّر الرقم وتحدّث الشاشة فوراً
          setState(() {
            _currentIndex = index; // نعطي المتغير الرقم الجديد حق الصفحة اللي اخترناها
          });
        },
        type: BottomNavigationBarType.fixed, // هذي عشان الأيقونات تثبت مكانها وما تتحرك بطريقة مزعجة
        selectedItemColor: const Color(0xFF8B6B43), // لون الأيقونة اللي محددينها الحين (بني)
        unselectedItemColor: Colors.grey, // لون باقي الأيقونات اللي مو محددة (رمادي)
        items: const [
          // هنا نرتب الأزرار اللي بتطلع تحت
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

// هذي الشاشة الرئيسية (الترحيبية)، وهي ثابتة (Stateless)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SingleChildScrollView عشان لو كانت الشاشة صغيرة يقدر المستخدم يسحب وينزل لتحت
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // نعطي مساحة (هوامش) من كل الجهات عشان الكلام ما يلزق في الأطراف
          child: Column( // عمود يرتب الأشياء تحت بعض
            mainAxisAlignment: MainAxisAlignment.center, // نرتب العناصر في نص الشاشة بالضبط
            children: [
              const SizedBox(height: 20), // صندوق فاضي يعطينا مساحة (زي ما تضغط Enter عشان تنزل سطر)
              
              // سوينا شعار (Logo) بالكود بدل ما نجيب صورة جاهزة!
              Container(
                width: 320, // عرض الشعار
                height: 200, // طول الشعار
                decoration: BoxDecoration(
                  color: const Color(0xFFFAF6F2), // لون بيج فاتح لبطاقة الشعار
                  borderRadius: BorderRadius.circular(30), // نخلي زوايا البطاقة دائرية
                  boxShadow: [
                    // هذا الكود يسوي "ظل" خفيف تحت البطاقة عشان تطلع بارزة وحلوة
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect( // هذي عشان الصورة اللي جوا ما تطلع برّا الزوايا الدائرية ويكون شكلها مرتب
                  borderRadius: BorderRadius.circular(30),
                  child: Stack( // الـ Stack يسمح لنا نحط الأشياء فوق بعض (طبقات)
                    alignment: Alignment.center, // نرتب كل شيء في النص
                    children: [
                      // الطبقة اللي وراء: صورة البتراء
                      Opacity( // Opacity تسوي شفافية للصورة عشان تطلع باهتة ومو مزعجة (زي العلامة المائية)
                        opacity: 0.15,
                        child: Image.asset(
                          'assets/images/3.jpeg',
                          width: double.infinity, // تاخذ كل العرض المتاح
                          height: double.infinity, // تاخذ كل الطول المتاح
                          fit: BoxFit.cover, // نعبي المكان كامل بالصورة
                        ),
                      ),
                      // الطبقة اللي قدام: الأشكال الهندسية وكلمة التطبيق
                      Column( // نرتبها كعمود
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // هذي الأكواد ترسم قوس مربع (شكل هندسي) يرمز للتطبيق
                          Column(
                            children: [
                              Container(
                                width: 55,
                                height: 50,
                                decoration: const BoxDecoration(
                                  // نرسم حدود القوس (فوق ويمين ويسار) بلون بني
                                  border: Border(
                                    top: BorderSide(color: Color(0xFFD3BCA4), width: 14),
                                    left: BorderSide(color: Color(0xFFD3BCA4), width: 14),
                                    right: BorderSide(color: Color(0xFFD3BCA4), width: 14),
                                  ),
                                  // ندور الزوايا اللي فوق بس
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(28),
                                    topRight: Radius.circular(28),
                                  ),
                                ),
                              ),
                              // هذي قاعدة القوس الصغير اللي تحت
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
                          const SizedBox(height: 12), // مسافة بسيطة
                          // اسم التطبيق اللي يظهر في الشعار
                          const Text(
                            'Jordan Explorer',
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFFA69076), // بني فاتح
                              fontWeight: FontWeight.w600, // خط سميك شوي
                              fontFamily: 'Times New Roman', // خط كلاسيكي فخم
                              letterSpacing: 1.2, // مسافة بسيطة بين الحروف عشان تطلع مرتبة
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40), // مسافة
              // النص التعريفي الأساسي للتطبيق
              const Text(
                'يعرض تطبيق Jordan Explorer\nأشهر المعالم السياحية في الأردن\nبطريقة تفاعلية وسهلة',
                textAlign: TextAlign.center, // نوسط النص
                style: TextStyle(
                  fontSize: 18, 
                  color: Colors.black87, 
                  height: 1.5, // المسافة بين السطور
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 50),
              // نص تشجيعي بسيط
              const Text(
                'اكتشف الأردن بطريقة جديدة',
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              // هذي الكبسة (الزر) اللي توديك لشاشة الفيديو
              ElevatedButton.icon(
                onPressed: () {
                  // هنا نستخدم (Navigator) اللي هو زي "التاكسي" في فلاتر، يأخذك من شاشة لشاشة ثانية!
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VideoScreen()), // نوديه لشاشة الـ VideoScreen
                  );
                },
                icon: const Icon(Icons.play_circle_fill, color: Colors.white), // شكل أيقونة الزر
                label: const Text(
                  'Watch Intro Video', // نص الزر
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C3E50), // لون الزر أزرق غامق
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // كبرنا الزر شوي من جوا
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // خلينا أطراف الزر دائرية
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

// هذي الشاشة اللي يشتغل فيها الفيديو التعريفي (وهي متغيرة Stateful لأن الفيديو يتحرك وتتغير حالته)
class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  // هذا المتغير المبرمج (الكنترولر) هو زي الريموت كنترول للفيديو، يشغله ويوقفه
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    // هنا نقول للكنترولر: "روح جيب الفيديو من هذا المسار وجهزه للتشغيل"
    _controller = VideoPlayerController.asset('assets/video/ved.mp4')
      ..initialize().then((_) {
        // إذا خلص تحميل الفيديو وصار جاهز، حدّث الشاشة عشان يتم عرض الفيديو (تنبيه الشاشة)
        setState(() {});
      });
  }

  // هذي الدالة تشتغل لما تطلع من الشاشة أو تقفلها
  @override
  void dispose() {
    // مهم جداً نطفي مشغل الفيديو ونتخلص منه، عشان ما يجلس يشتغل في الخلفية ويستهلك بطارية الجهاز!
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jordan Explorer'),
      ),
      body: SingleChildScrollView( // عشان نقدر نسحب لتحت
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // هذا المستطيل اللي بينعرض جواه الفيديو
              Container(
                width: double.infinity, // خذ الشاشة بالعرض كامل
                height: 250, // طول مستطيل الفيديو
                color: Colors.black12, // لون خلفية خفيفة قبل يشتغل الفيديو
                // هل الكنترولر جاهز والفيديو محمل؟
                child: _controller != null && _controller!.value.isInitialized
                    ? Stack( // إذا جاهز، حط الفيديو وفوقه زر التشغيل
                        alignment: Alignment.center,
                        children: [
                          // هنا ينعرض الفيديو الحقيقي بالأبعاد الصحيحة
                          AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: VideoPlayer(_controller!),
                          ),
                          // زر التشغيل والإيقاف (Play/Pause)
                          IconButton(
                            iconSize: 60, // زر كبير بالنص
                            icon: Icon(
                              // إذا الفيديو قاعد يشتغل الحين؟ اعرض علامة التوقيف (Pause)، وإلا اعرض علامة التشغيل (Play)
                              _controller!.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // لما ينضغط الزر، نحدّث الشاشة
                              setState(() {
                                if (_controller!.value.isPlaying) {
                                  _controller!.pause(); // وقّف الفيديو
                                } else {
                                  _controller!.play(); // شغّل الفيديو
                                }
                              });
                            },
                          ),
                        ],
                      )
                    : const Center(child: CircularProgressIndicator()), // إذا الفيديو لسا يلف ويحمل، اعرض دائرة التحميل!
              ),
              const SizedBox(height: 30),
              // كلام يشرح وش اللي قاع ينعرض في الفيديو
              const Text(
                'يقدم هذا الفيديو أشهر المعالم السياحية في الأردن بما فيها البتراء، وادي رم، جرش، عجلون، وجبل نيبو.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// هذي صفحة المعالم، قائمة بكل الأماكن السياحية
class AttractionsScreen extends StatelessWidget {
  const AttractionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // هذي قائمة عادية سويناها يدوي، فيها كل معلم واسمه ومسار صورته ورمزه السري (ID) حقه
    // عشان نقدر نسوي منها أزرار كثيرة بوقت واحد (لوب) بدل ما نكرر الكود 5 مرات ويتعبنا
    final List<Map<String, String>> attractions = [
      {'name': 'Petra', 'image': 'assets/images/3.jpeg', 'id': 'petra'},
      {'name': 'Jerash', 'image': 'assets/images/4.jpeg', 'id': 'jerash'},
      {'name': 'Wadi\nRum', 'image': 'assets/images/6.jpeg', 'id': 'wadirum'},
      {'name': 'Mount\nNebo', 'image': 'assets/images/8.jpeg', 'id': 'nebo'},
      {'name': 'Ajloun\nCastle', 'image': 'assets/images/5.jpeg', 'id': 'ajloun'},
    ];

    return SingleChildScrollView( // قابلة للتمرير للأسفل
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // العنوان الرئيسي فوق
            const Text(
              'Tourist Attractions in Jordan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B6B43),
                decoration: TextDecoration.underline, // سطر تحت الكلمة
              ),
            ),
            const SizedBox(height: 20),
            // شرح بسيط لليوزر
            const Text(
              'تتيح لك هذه الصفحة التعرف على أبرز المناطق السياحية في الأردن. يمكنك الضغط على الزر الخاص بكل منطقة للاطلاع على معلوماتها. تاريخها، وأهم ما يميزها من معالم جميلة. اختر المنطقة التي ترغب بمعرفتها واستكشف تفاصيلها بسهولة',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 15, height: 1.5, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            // (Wrap) ترتب الأزرار جنب بعض، وإذا خلص السطر تنزل للسطر اللي تحته تلقائي!
            Wrap(
              spacing: 15, // مسافة أفقية يمين ويسار
              runSpacing: 20, // مسافة عمودية فوق وتحت
              alignment: WrapAlignment.center, // رتبهم في النص
              // هنا الكود العبقري! يلف على القائمة (attractions) ويسوي دالة الزر لكل وحدة فيهم
              children: attractions.map((attraction) => _buildAttractionButton(context, attraction)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // هذي دالة سويناها برا، ترسم لنا زر واحد ونمرر لها بيانات المعلم عشان تصممه بناءً عليها
  Widget _buildAttractionButton(BuildContext context, Map<String, String> data) {
    // (InkWell) تخلّي المستطيل ينضغط زي الزر ويطلع تأثير (تأثير الحبر)
    return InkWell(
      onTap: () {
        // لما تنضغط، افتح شاشة التفاصيل، وأهم شي "أرسل الرمز السري id" حق المكان المختار
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AttractionDetailsScreen(attractionId: data['id']!),
          ),
        );
      },
      child: Container(
        width: 160, // عرض الزر
        height: 70, // طول الزر
        decoration: BoxDecoration(
          color: const Color(0xFF1E2638), // لون أزرق كحلي للزر
          borderRadius: BorderRadius.circular(35), // أطراف الزر دائرية مرة كأنها كبسولة
          boxShadow: const [
            BoxShadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 4), // ظل للكسبولة
          ]
        ),
        // نقص الصورة الزايدة عشان ما تطلع برّا الأطراف الدائرية وتخبّص الشكل
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Expanded( // أعطي النص المساحة كلها اللي تبقّت
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  data['name']!, // اسم المعلم من البيانات
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
            // مساحة للصورة حق المكان المربع اللي بجهة اليمين من الزر
            SizedBox(
              width: 80,
              height: 70,
              child: Image.asset(
                data['image']!, // نعطيها مسار الصورة من البيانات المرسلة
                fit: BoxFit.cover, // غطي المربع كامل
                errorBuilder: (c, e, s) => const Icon(Icons.image, color: Colors.grey), // لو الصورة خربانة أو مو موجودة، حط أيقونة مكانها
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// هذي الشاشة اللي تفتح وتوريك تفاصيل وصور المعلم، وهي ثابتة
class AttractionDetailsScreen extends StatelessWidget {
  // متغير يخزن الـ id اللي وصلها عشان تعرف وش المكان المطلوب وتبحث عنه
  final String attractionId;

  const AttractionDetailsScreen({super.key, required this.attractionId});

  @override
  Widget build(BuildContext context) {
    // هنا دالة نناديها عشان تجيب لنا بيانات المعلم الكاملة (زي الصور والنص)
    final data = _getAttractionData(attractionId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jordan Explorer'),
        backgroundColor: const Color(0xFF2C3E50), // حطينا لون مميز للقسم هذا (كحلي غامق)
        iconTheme: const IconThemeData(color: Colors.white), // لون السهم حق الرجوع خلاه أبيض
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // الصورة الأولى، تنسحب من بيانات المكان المحددة
            Image.asset(
              data['image1']!,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            // الصورة الثانية، تنحط تحت الصورة الأولى وتكبر للصورة الأساسية اللي عرضناها قبل
            Image.asset(
              data['image2']!,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
            // الحين نجي للمحتوى النصّي (الكلام)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    data['title']!, // اسم المعلم (البترا مثلاً) وينكتب بخط كبير بالبداية كعنوان.
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B6B43),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    data['description']!, // القصة عن الديرة، وكلام تفصيلي يشرح تاريخ المكان وتفاصيله
                    textAlign: TextAlign.right, // رتبهم ع اليمين
                    style: const TextStyle(fontSize: 16, height: 1.7), // حجم الخط والتباعد بين السطور للقراءة بـ أريحية
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // الدالة هذي مهمتها تشوف وش الـ id اللي وصل، وعلى أساسه ترسل الشرح الكامل والصور للمكان! (هذا الكود كان موجود قبل بملف ثاني)
  Map<String, String> _getAttractionData(String id) {
    switch (id) {
      case 'petra': // إذا الـ id كان petra؟ أعطيه هالبيانات الخاصة بالبتراء كالتالي 
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
      case 'ajloun': // لو جاني id لـ عجلون، برمي البيانات هذي له 
        return {
          'title': 'Ajloun Castle',
          'image1': 'assets/images/7.jpeg',
          'image2': 'assets/images/5.jpeg',
          'description': 'قلعة عجلون قلعة تاريخية إسلامية تقع في شمال الأردن. بنيت في القرن الثاني عشر لحماية المنطقة من الحملات الصليبية. تتميز القلعة بموقعها المرتفع وإطلالتها على المناطق المحيطة.',
        };
      default: // لو جاني مكان مدري وشّه أساساً وغريب؟
        return {'title': 'Unknown', 'image1': '', 'image2': '', 'description': ''};
    }
  }
}

// صفحة الأسئلة والاختبارات الممتعة، متغيرة (Stateful) لأنها بتحفظ وش جاوب اليوزر!
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // هذي المتغيرات الخمسة (واحد لكل سؤال) بتحفظ حرفياً الديرة اللي اختارها اليوزر. أول شيء تكون فاضية (Null) 
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  String? answer5;
  // هذا المتغير يُشير إذا اليوزر خلّص أموره وكبس إرسال ولا باقي؟ (false يعني لسا يختبر)
  bool done = false;
  // هنا نحسب النتيجة النهائية تبدأ من الصفر (0)
  int score = 0;

  @override
  Widget build(BuildContext context) {
    // هذي الشاشه اللي تطلع له بالنهايه (إذا كان done = true، يعني خلّص الاختبار وارسله) 
    if (done) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // نعرض النتيجة بالنص
          children: [
            Text('نتيجتك: $score / 5', // نعرض كم جاب من خمس درجات؟ 
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            // لو جاب 3 درجات وفوق نعطيه "ممتاز"، غيرها نعطيه "حاول مرة ثانية"
            Text(score >= 3 ? '🎉 ممتاز يا وحش!' : '😕 معوض خير! جرب مره ثانية',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            // هذا الزر عشان "يعيد الاختبار من جديد"، نصفّر فيه كل شي حرفياً
            ElevatedButton(
              onPressed: () {
                setState(() {
                  done = false; // نرجع الشاشة لحالتها الأصلية
                  score = 0; // نرجع النتيجة صفر  
                  // نجعل كل الإجابات فارغه بحال دخل مره ثانيه ما نبي الاجوبه تكون فيه سلفاً
                  answer1 = answer2 = answer3 = answer4 = answer5 = null;
                });
              },
              child: const Text('إعادة الاختبار'),
            ),
          ],
        ),
      );
    }

    // هذي شاشة الأسئلة العادية، اللي تطلع قبل تسلم للنتيجة.
    return SingleChildScrollView( // عشان نتيح لليوزر ينزّل لآخر الشاشة اللي فيها الزر!
      padding: const EdgeInsets.all(16),
      child: Column( // عمود يرتب الأسئلة 
        crossAxisAlignment: CrossAxisAlignment.start, // يبدأ ترتيب الاسئلة من الجانب مو بالنص بالكامل 
        children: [
          // السؤال الأول
          const Text('السؤال 1: أي مدينة تُعرف بالمدينة الوردية؟',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          // هذي أزرار الراديو، إذا ضغطها اليوزر تنحفظ القيمة المعنية ('جرش' مثلاً) في متغير السؤال الأول answer1
          RadioListTile(title: const Text('جرش'), value: 'جرش',
              groupValue: answer1, onChanged: (v) => setState(() => answer1 = 'جرش')),
          RadioListTile(title: const Text('العقبة'), value: 'العقبة',
              groupValue: answer1, onChanged: (v) => setState(() => answer1 = 'العقبة')),
          RadioListTile(title: const Text('البترا'), value: 'البترا',
              groupValue: answer1, onChanged: (v) => setState(() => answer1 = 'البترا')),

          const Divider(), // خط يفصل بين كل سؤال والثاني للترتيب 

          // السؤال الثاني
          const Text('السؤال 2: أي موقع يُعرف باسم وادي القمر؟',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          RadioListTile(title: const Text('جبل نيبو'), value: 'جبل نيبو',
              groupValue: answer2, onChanged: (v) => setState(() => answer2 = 'جبل نيبو')),
          RadioListTile(title: const Text('وادي رم'), value: 'وادي رم',
              groupValue: answer2, onChanged: (v) => setState(() => answer2 = 'وادي رم')),
          RadioListTile(title: const Text('عجلون'), value: 'عجلون',
              groupValue: answer2, onChanged: (v) => setState(() => answer2 = 'عجلون')),

          const Divider(), // سطر فاصل

          // السؤال الثالث
          const Text('السؤال 3: في أي مدينة توجد آثار رومانية شهيرة؟',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          RadioListTile(title: const Text('البترا'), value: 'البترا',
              groupValue: answer3, onChanged: (v) => setState(() => answer3 = 'البترا')),
          RadioListTile(title: const Text('العقبة'), value: 'العقبة',
              groupValue: answer3, onChanged: (v) => setState(() => answer3 = 'العقبة')),
          RadioListTile(title: const Text('جرش'), value: 'جرش',
              groupValue: answer3, onChanged: (v) => setState(() => answer3 = 'جرش')),

          const Divider(),

          // السؤال الرابع
          const Text('السؤال 4: أي موقع يتميز بإطلالة على البحر الميت؟',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          RadioListTile(title: const Text('جرش'), value: 'جرش',
              groupValue: answer4, onChanged: (v) => setState(() => answer4 = 'جرش')),
          RadioListTile(title: const Text('قلعة عجلون'), value: 'قلعة عجلون',
              groupValue: answer4, onChanged: (v) => setState(() => answer4 = 'قلعة عجلون')),
          RadioListTile(title: const Text('جبل نيبو'), value: 'جبل نيبو',
              groupValue: answer4, onChanged: (v) => setState(() => answer4 = 'جبل نيبو')),

          const Divider(),

          // السؤال الخامس الأخير
          const Text('السؤال 5: أي قلعة بُنيت في القرن الثاني عشر؟',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          RadioListTile(title: const Text('جرش'), value: 'جرش',
              groupValue: answer5, onChanged: (v) => setState(() => answer5 = 'جرش')),
          RadioListTile(title: const Text('قلعة عجلون'), value: 'قلعة عجلون',
              groupValue: answer5, onChanged: (v) => setState(() => answer5 = 'قلعة عجلون')),
          RadioListTile(title: const Text('البترا'), value: 'البترا',
              groupValue: answer5, onChanged: (v) => setState(() => answer5 = 'البترا')),

          const SizedBox(height: 20),

          // الزر اللي بالنهاية لإرسال الأجوبة جميعاً 
          Center(
            child: ElevatedButton(
              onPressed: () {
                // شرط مهم: يتأكد البرنامج أولاً إذا اليوزر ما جاوب على واحد أو أكثر من الخمسة أسئلة. (هل فيهم شيء فاضي؟ null)
                if (answer1 == null || answer2 == null || answer3 == null ||
                    answer4 == null || answer5 == null) {
                  // إذا فيه فاضي، طلّع شريط التنبيه الأسفل الصغير للمستخدم 
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('يرجى الإجابة على جميع الأسئلة قبل الإرسال')));
                } else {
                  // وإذا أموره تمام ومجاوب على الكل؟ الحين بنحسب الدرجة
                  int s = 0; // متغير مؤقت للنتيجة وبنبداه بـ صفر 
                  if (answer1 == 'البترا') s++; // لو جوابه الأول صح نعطيه درجة
                  if (answer2 == 'وادي رم') s++; // لو الثاني وادي رم صح له درجة
                  if (answer3 == 'جرش') s++; // نعطيه درجة
                  if (answer4 == 'جبل نيبو') s++; 
                  if (answer5 == 'قلعة عجلون') s++; 
                  // خلصنا الحسبة؟ نسوي تحديث للشاشة، نحدث الدون بـ ترو (يعني خلصت خلاص)، ونحشو درجة النتيجة (s) للمتغير الأساسي.
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

// شاشة التقييم (متغيرة كمان عشان تتفاعل مع النجوم)
class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  // كم نجمة اختار؟ تبدأ بصفر يعني مافيه ولا نجمة
  int _rating = 0;
  // هل كبس اليوزر إرسال التقييم ولا لسّه؟ تبدأ بـ فلص
  bool _isSubmitted = false;
  // هذا الريموت كنترول اللي يتحكم في الصندوق اللي يكتبون فيه الكلام (عشان نقدر نفضيه لاحقاً)
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // هذي شاشة الشكر اللي تطلع "بعد" الإرسال (لما تكون _isSubmitted قيمتها صحيحة)
    if (_isSubmitted) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // وسط الكلام
          children: [
            const Text(
              'Thank You for Your Feedback', // شكرناه
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
                // لما يضغط "العودة"، نرجّعه لـ شاشه التقييم ونفرّغ كل تعبئاته السابقة عشان يقيّم ثاني لو يبي
                setState(() {
                  _isSubmitted = false; // نرجع الشاشة لحالتها الأصلية
                  _rating = 0; // نصفر النجوم لـ ولا شي!
                  _commentController.clear(); // نمسح الكلام اللي كتبه جوا المربع النصي
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE5D5C1), // لون بيج
              ),
              child: const Text('العودة', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      );
    }

    // شاشة التقييم قبل لا تُرسَل
    return SingleChildScrollView( // عشان تسمح بتمرير نزولاً وصعوداً في الهاتف المحمول
      child: Padding(
        padding: const EdgeInsets.all(30.0), // نعطيه كذا مساحه من الاطراف للترتيب 
        child: Column(
          children: [
            const Text( // عنوان 
              'User Feedback',
              style: TextStyle(
                fontSize: 22,
                color: Color(0xFF8B6B43),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(thickness: 2), // خط فاصل جميل بسُمك درجتين 
            const SizedBox(height: 30),
            const Text('How would you rate our app?', style: TextStyle(fontSize: 16)), // السؤال الموجه للمستخدم عن التقييم
            const SizedBox(height: 20),
            
            // هنا نرسم 5 نجوم جنب بعض بشكل متتابع 
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // وسط النجوم بالنص
              // هذي تسوي لنا لفة (Loop) خمس مرات عشان توفر تكرار الكود
              children: List.generate(5, (index) {
                return IconButton(
                  // هنا ذكاء الكود: هل ترتيب هذي النجمة الحالية أقل من التقييم اللي اختاره؟
                  // إذا إيه، لوّنها (أيقونة نجمة مليانة)، لو لا خلها مفرغة فاضية حواف بس!
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    size: 40,
                    color: const Color(0xFFD4AF37), // لون النجمة ذهبي جميل
                  ),
                  onPressed: () {
                    // لو ضغط النجمة الثالثة، يتحدث المتغير ويخليه 3 (عشان يلوننا أول 3 نجوم) وهكذا
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
            // مربع النصوص "حقل التعليق الإضافي" 
            TextField(
              controller: _commentController, // نربطه بالكنترولر حقنا زي ما أسلفنا
              maxLines: 3, // نكبر المربع عشان ياخذ مساحه ويكتب براحته
              decoration: InputDecoration( // ديكور بسيط للمربع 
                labelText: 'اكتب تعليقك هنا',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), // أطرافه دائرية 
              ),
            ),
            const SizedBox(height: 30), // سبيس مسافه 
            // الزر اللي ينرسل منه التقييم النهائي
            ElevatedButton(
              // هنا الكود يشترط: إذا هو ما قيّم ولا بنجمه (ترا ريتنج 0) نعطّل الزر (نرسل له null)، عشان نجبره يحط لنا نجمه على الأقل!
              onPressed: _rating == 0
                  ? null
                  : () {
                      // أما لو عطانا نجوم وأموره تمام؟ هنا نقوله شكراً وأرسلنا الموضوع وتتحدث للشاشه اللي تسوي شكراً(_isSubmitted = true)
                      setState(() {
                        _isSubmitted = true;
                      });
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD4C4B7),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12), // حجم الزر كبير ومريح لليد 
              ),
              child: const Text('إرسال', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
