# شرح مشروع Jordan Explorer (باللهجة الأردنية) 🇯🇴

يا هلا فيك! هاد الملف مجهز مخصوص عشان تفهم كل فتفوتة بالمشروع، حتى لو كنت مبتدئ وما عندك خبرة سابقة بالبرمجة. رح نشرح كل سطر وكل ملف بإذن الله وكيف بيرتبطوا ببعض.

## 1. شو قصة المجلدات الأساسية بالبروجكت؟
- **مجلد `lib`**: هاد المجلد هو قلب المشروع، وفيه كل الأكواد البرمجية (لغة دارت - Dart) اللي بتشغل التطبيق تبعنا.
- **مجلد `assets`**: هاد المجلد بنحط فيه أصول التطبيق مثل الصور (`images`) والفيديوهات (`video`) عشان نستخدمها جوا التطبيق.
- **ملف `pubspec.yaml`**: هاد الملف زي "الهوية" تبعت المشروع، بنضيف فيه أي "مكتبات" خارجية بدنا نستخدمها (رح نشرحها كمان شوي)، وبنعرف فيه مكان الصور والفيديوهات عشان التطبيق يقدر يقرأهم ومينساش يحطهم بالتطبيق لما ينزله عالموبايل.

## 2. شو يعني "مكتبة" (Package)؟
تخيل إنك بدك تبني بيت، بدل ما تصنع الطوب والاسمنت وتخترعهم بنفسك، بتروح تشتري مواد جاهزة وبتستخدمها. بالبرمجة نفس الاشي بالضبط، "المكتبة" هي أكواد جاهزة عملوها مبرمجين تانيين عشان يسهلوا علينا الشغل.
- **مكتبة `video_player`**: ضفناها في ملف `pubspec.yaml` عشان نقدر نشغل فيديو جوا التطبيق بكل سهولة، بدل ما نكتب تفاصيل معقدة من الصفر.
- **مكتبة `cupertino_icons`**: مكتبة أيقونات جاهزة بتيجي مع فلاتر.

---

## 3. كيف بننادي على الملفات ببعضها؟
بالبرمجة مستحيل نكتب كل اشي بملف واحد كبير لأنه رح يصير عجقة. فبنقسم الشاشات لملفات مرتبة، ولما ملف بده يستعمل شاشة من ملف تاني بيستعمل كلمة `import` فوق أول الملف.
زي كأنك بتحكيله: "جيبلي هداك الملف وانسخه عندي عشان أقدر استخدمه!".
مثال: لما نكون بملف الدخول بدنا نفتح الشاشة الرئيسية بنكتب فوق: `import 'screens/main_screen.dart';` (يعني استدعيلي شاشة المين سكرين اللي جوا مجلد الـ screens).

---

## 4. شرح ملفات الكود (جوا مجلد `lib`) سطر بسطر!

### ملف `main.dart` (البوابة الرئيسية)
هاد الملف هو أول اشي بيشتغل بس تفتح التطبيق، وهو اللي بجهز كل اشي.

```dart
import 'package:flutter/material.dart'; // بنستدعي هون أدوات فلاتر الأساسية اللي بتخلينا نرسم الشاشات والأزرار والتطبيقات.
import 'screens/main_screen.dart'; // بنستدعي ملف الشاشة الرئيسية تبعتنا عشان نستخدمها تحت كأول شاشة.

void main() { // هاي الدالة (Function) هي نقطة البداية، أول ما يشتغل التطبيق ببلش يقرا من هون بالضبط.
  runApp(const JordanExplorerApp()); // بنحكيلو "شغّل التطبيق اللي بانيناه تحت واللي اسمه JordanExplorerApp".
}

// هون بنعرف واجهة التطبيق تبعنا، وعبارة عن (StatelessWidget) يعني شاشة أو غلاف ثابت ما بتتغير خصائصه.
class JordanExplorerApp extends StatelessWidget {
  const JordanExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp هو الغلاف العزب الرئيسي لكل التطبيق، بيوفرلنا أمور زي الألوان والخطوط والانتقالات بين الصفحات.
    return MaterialApp(
      title: 'Jordan Explorer', // اسم التطبيق اللي بيطلع بالخلفية لما تصغر التطبيق
      debugShowCheckedModeBanner: false, // بنخفي شريط "Debug" الأحمر المزعج اللي بطلع عالزاوية فوق وقت البرمجة.
      theme: ThemeData( // هون بنحدد "الثيم" أو الديكور والألوان العامة للتطبيق.
        colorScheme: ColorScheme.fromSeed( // بنبني كل ألوان التطبيق من لون أساسي.
          seedColor: const Color(0xFFC19A6B), // لون أساسي قريب من لون رمل البترا والصحراء الأردنية (بني فاتح).
          surface: const Color(0xFFF0EBE1), // لون الخلفية الفاتح المريح للعين في أغلب الشاشات.
        ),
        useMaterial3: true, // بنستخدم أحدث نظام تصميم وتنسيق من جوجل (Material 3).
        appBarTheme: const AppBarTheme( // تصميم الشريط العلوي اللي بكون فوق بكل شاشة وين ما رحت.
          backgroundColor: Color(0xFFE5D5C1), // لونه.
          centerTitle: true, // بنخلي العنوان ييجي بالنص بدل الطرف.
          titleTextStyle: TextStyle( // شكل خط هذا العنوان.
            color: Color(0xFF4A4A4A),
            fontSize: 22,
            fontWeight: FontWeight.bold, // عريض (غامق).
          ),
        ),
      ),
      home: const MainScreen(), // // أول شاشة رح تطلع للمستخدم بس يفتح التطبيق هي MainScreen اللي جبناها من الملف التاني بالـ import.
    );
  }
}
```

---

### ملف `screens/main_screen.dart` (الهيكل وشريط التنقل)
هاد الملف بيمثل القالب اللي جواته "شريط التنقل السفلي" عشان نبدل بين الصفحات بدون ما نفتح ونسكر شاشات. بنسميه `StatefulWidget` لأنه "بيتغير" بناءً على الكبسة اللي بيكبسها المستخدم.

```dart
import 'package:flutter/material.dart';
import 'home_screen.dart'; // بنستدعي الشاشات الـ 4 عشان نستخدمهم جوا شريط التنقل.
import 'attractions_screen.dart';
import 'quiz_screen.dart';
import 'rating_screen.dart';

class MainScreen extends StatefulWidget { // استخدمنا Stateful لانه الشاشة رح تتغير وتتبدل.
  const MainScreen({super.key});

  @override // .. أكواد لتكوين حالة الشاشة ..
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // متغير اسمه _currentIndex بيحفظ إحنا بأي صفحة حالياً بالترتيب. (0 يعني หน้า أولى، 1 يعني ثانية...)
  int _currentIndex = 0;

  // هاي قائمة ومصفوفة (List) رتبنا فيها الـ 4 شاشات تبعونا بالترتيب عشان نستدعيهم بالرقم.
  final List<Widget> _pages = [
    const HomeScreen(), // اندكس 0
    const AttractionsScreen(), // اندكس 1
    const QuizScreen(), // اندكس 2
    const RatingScreen(), // اندكس 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold هو الهيكل الأساسي لأي شاشة (سقف وأرضية لنحط عليهم الأشياء).
      appBar: AppBar( // الشريط العلوي (السقف).
        title: const Text('Jordan Explorer'),
      ),
      
      // المحتوى بالنص (الجسم): بدلاً ما نحط شاشة ثابتة، بنجيب الشاشة من القائمة بناءً على الرقم اللي محفوظ بـ _currentIndex.
      // يعني لو _currentIndex كان 0، رح يعرض HomeScreen!
      body: _pages[_currentIndex], 
      
      // شريط التنقل السفلي (الأرضية).
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // بنقله شو الزر المكبوس حالياً عشان يضوي.
        onTap: (index) { // بس المستخدم يكبس على أي أيقونة تحت، بيشتغل هاد الكود وبيبعتلنا رقم الزر المكبوس (index).
          setState(() { // setState بتعمل "تحديث فوري للشاشة"، وبنغير الرقم للصفحة الجديدة اللي انكبست.
            _currentIndex = index; // مثلا صار 2، الشاشة لحالها بتحدث وبتعرض الـ QuizScreen.
          });
        },
        type: BottomNavigationBarType.fixed, // عشان تضل الأيقونات ثابتة وما تتحرك وتصغر بشكل مزعج.
        selectedItemColor: const Color(0xFF8B6B43), // لون الأيقونة اللي محددة (بني).
        unselectedItemColor: Colors.grey, // لون الباقي رمادي.
        items: const [ // هون بنرص الأزرار اللي تحت (أيقونة + كلمة) بالترتيب (0, 1, 2, 3)
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'), // 0
          BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted), label: 'المعالم'), // 1
          BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: 'الاختبار'), // 2
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'التقييم'), // 3
        ],
      ),
    );
  }
}
```

---

### ملف `screens/home_screen.dart` (الشاشة الرئيسية والترحيب)
هاي أول شاشة بيشوفها المستخدم بالنص، فيها كلام ترحيبي وكبسة للفيديو.

```dart
import 'package:flutter/material.dart';
import 'video_screen.dart'; // بنستدعيه عشان نقدر ننتقل شاشة الفيديو بس نكبس الزر.

class HomeScreen extends StatelessWidget { // شاشة ثابتة (Stateless)
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // أداة بتسمح للشاشة انه يصير فيها سكرول (تمرير لفوق ولتحت) لو كانت شاشة التلفون صغيرة.
      child: Center( // بنحط كل اشي بنص الشاشة
        child: Padding( // بنعمل مسافات وفراغ من الجوانب (هوامش) عشان الكلام ما يلزق بطرف الشاشة.
          padding: const EdgeInsets.all(20.0),
          child: Column( // Column بتسمحلك تصفط الأشياء تحت بعض (زي عامود).
            mainAxisAlignment: MainAxisAlignment.center, // رتبهم بنص العامود
            children: [
              const SizedBox(height: 20), // صندوق فاضي بنستخدمه زي (Enter) عشان نعمل مسافة.
              
              // تصميم الشعار (Logo) ركبناه تركيب بالكود بدل صورة جاهزة!
              Container( 
                width: 320, height: 200, // العرض والطول للبطاقة
                decoration: BoxDecoration( // بنزين البطاقة بخلفية بيج وظل وزوايا مدورة
                  color: const Color(0xFFFAF6F2),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [ BoxShadow(blurRadius: 10, offset: const Offset(0, 4)) ], // خيال البطاقة
                ),
                child: ClipRRect( // بنقص الأطراف عشان تضل مدورة وما تطلع الصورة برة.
                  borderRadius: BorderRadius.circular(30),
                  child: Stack( // Stack بتسمح نحط الأشياء "فوق بعض" (زي صورة وبالطبقة اللي فوقها بنحط نص).
                    alignment: Alignment.center,
                    children: [
                      // الطبقة اللي تحت: صورة البترا الخلفية
                      Opacity( // بنعمل شفافية بنسبة صغيرة (0.15) للصورة عشان تطلع زي العلامة المائية باهتة.
                        opacity: 0.15,
                        child: Image.asset('assets/images/3.jpeg', fit: BoxFit.cover),
                      ),
                      // الطبقة اللي فوق: القوس المربع وكلمة Jordan Explorer
                      ... // (هون في كود للأشكال الهندسية تبع القوس)
                      const Text('Jordan Explorer', style: TextStyle( fontSize: 22, ... )),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 40), // مسافة فاضية زيادة
              
              // النص التعريفي الأساسي للتطبيق
              const Text('يعرض تطبيق Jordan Explorer\nأشهر المعالم السياحية...', textAlign: TextAlign.center),
              
              // زر (مشاهدة الفيديو)
              ElevatedButton.icon( // زر مع أيقونة
                onPressed: () { // الكود اللي بيشتغل بس ينكبس الزر
                  // Navigator.push: هو الأمر العظيم بفلاتر اللي "بينقلك" من شاشة لشاشة تانية. بنحكيله ادفعنا (push) لشاشة الفيديو.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VideoScreen()), // روح على شاشة VideoScreen
                  );
                },
                icon: const Icon(Icons.play_circle_fill, color: Colors.white), // شكل أيقونة الزر
                label: const Text('Watch Intro Video'), // نص الزر
                style: ElevatedButton.styleFrom( // تلوين وتدوير الزر
                  backgroundColor: const Color(0xFF2C3E50), // لون أزرق غامق
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### ملف `screens/video_screen.dart` (شاشة الفيديو - قصة المكتبة)
هون بنستخدم المكتبة الجاهزة `video_player` اللي جبناها بالـ `pubspec.yaml`. الشاشة نوعها Stateful عشان نقدر نحدث الفيديو لما نزبط التوقيف والتشغيل.

```dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart'; // بنادي عالمكتبة الخارجية عشان نستخدمها.

class _VideoScreenState extends State<VideoScreen> {
  // متغير من نوع خاص رح يخزن الشغلات اللي بتتحكم بالفيديو (الريموت كنترول تبع المشغل).
  VideoPlayerController? _controller; 

  // دالة initState بتشتغل لحالها "أول ما تفتح الشاشة وتتفعل، وقبل ما تنرسم".
  @override
  void initState() {
    super.initState();
    // بنقله جيب الفيديو من ملفات التطبيق (المسار assets/video/ved.mp4).
    _controller = VideoPlayerController.asset('assets/video/ved.mp4')
      ..initialize().then((_) { 
        // دالة then يعني: "بس تخلص تحميل الفيديو وجاهز للإقلاع"، اعمل تحديث للشاشة (setState) عشان نعرضه.
        setState(() {});
      });
  }

  // دالة dispose بتشتغل لحالها "لما تطلع من الشاشة أو تسكرها وتعمل رجوع".
  @override
  void dispose() {
    // لازم ضروري ندمر مشغل الفيديو عشان ما يضل مشتغل بالخلفية وياكل من بطارية الجهاز وراماته!
    _controller?.dispose(); 
    super.dispose();
  }

  // جوا الـ build (مكان رسم الشاشة ع التلفون)
  // عملنا Scaffold بشريط علوي فيه عنوان التطبيق، وتحته Content.
  // جوا الـ Content في مستطيل أسود (Container) بنفحص فيه:
  // اذا مشغل الفيديو تحمل وجاهز (isInitialized)، بنعرض Stack فيه طبقتين:
  // 1- الفيديو (VideoPlayer) شغال تمام.
  // 2- فوق الفيديو بالنص زر Play/Pause. 
  // لما نكبس الزر، بنسأله (_controller!.value.isPlaying) هل الفيديو شغال حالياً؟ اذا اه بنوقفه بـ pause()، وإذا واقف بنشغله play()، وطبعا جوا setState عشان شكل الكبسة تتحدث.
  // وإذا لسا الفيديو ما تحمل يا سيدي بنعرض محله مؤشر تحميل بيلف (CircularProgressIndicator).
}
```

---

### ملف `screens/attractions_screen.dart` (قائمة المعالم السياحية)
هاي الصفحة فيها أزرار بأسماء وصور المعالم (بترا، جرش، العقبة...). بدل ما نكتب الزر 5 مرات ويصير كود طويل، كتبنا الزر مرة وحدة وبرمجناه يلف عالمدن!

```dart
// عملنا "قائمة بيانات" List فيها خريطة معلومات (Map) لكل مدينة (اسمها، مسار صورتها، و id كمعرف سري أو باسوورد لكل مدينة).
final List<Map<String, String>> attractions = [
  {'name': 'Petra', 'image': 'assets/images/3.jpeg', 'id': 'petra'},
  {'name': 'Jerash', 'image': 'assets/images/4.jpeg', 'id': 'jerash'},
  ... // كملنا باقي الـ 5 معالم..
];

// بعدين عرضناهم جوا أداة اسمها Wrap (واجب هاي الأداة إنها تصفط الأزرار جنب بعض، ولما يخلص حيز الشاشة بالسطر بتنزل سطر جديد لحالها تلقائياً).
// كل زر برمجناه جوا دالة خارجية سميناها _buildAttractionButton كنوع من الترتيب:
// لما المستخدم يرتخي ويكبس على الزر تبع (مثلاً البترا) (عن طريق دالة المفاتيح InkWell)...
// رح نستعمل المُعالج (Navigator) عشان ينقلنا لصفحة التفاصيل (AttractionDetailsScreen) ونبعتله الـ "id" تبع البترا اللي كبسنا عليه! 
// ليش؟ عشان الشاشة التانية تعرف انه إحنا كبسنا عالبترا مش جرش!
```

---

### ملف `screens/attraction_details_screen.dart` (تفاصيل المعلم)
الشاشة اللي بتستقبل الـ `id` وبناءً عليه بتعرض وصف دقيق مع صورتين حلوات للمدينة اللي انكبست. 

```dart
// هاي الشاشة متطورة عشان بتفتح على المدينة المطلوبة. فبتستقبل الداتا من الشاشة السابقة بالمتغير attractionId.
final String attractionId; 

// عملنا دالة تحت الشاشة اسمها _getAttractionData، وظيفتها تسحب المعلومات الدقيقة.
// بتاخد الـ id (مثلاً 'petra') وبتستخدم قاعدة الاختيار المتعدد (switch) يعني (في حال كان الايدي كذا، اعطيني معلومات كيت وكيت).
// فبترجع عنوان المدينة ووصفها باللغة العربية والصورتين تبعونها.
// وبالـ build، بنعرف متغير data وبياخد هاي المعلومات ليعرضها بكل بساطة (نعرض عنوان، وبعديه صورتين بالنص، بعدين نص الوصف بخط محترم).
```

---

### ملف `screens/quiz_screen.dart` (شاشة الاختبار والنتيجة)
شاشة ذكية بتعرض 5 أسئلة، وفيها "راديو بوتونز - RadioListTile" (دوائر الاختيار اللي جنبها كلام). 

```dart
// بما إنها بتعتمد على اختيارات المستخدم وعلامته فأكيد هي (StatefulWidget).

// عملنا متغيرات لكل سؤال عشان نحفظ إجابة المستخدم حرفياً شو اختار:
String? answer1; // متغير لحفظ جواب السؤال الأول
String? answer2;
... // وهيك للخمس أسئلة
int score = 0; // متغير بحسب العلامة (ببلش من صفر)
bool done = false; // متغير منطقي (صح أو خطأ) بيحكيلنا اذا اليوزر خلص الامتحان وكبس إرسال ولا لأ. بنبلش بـ خطأ!

// لما اليوزر يكبس على الزر الطويل آخر الصفحة "إرسال الإجابات":
// أول اشي الكود بيكتب شرط أمان (if): بتأكد إنه اليوزر جاوب على كل الـ 5 متغيرات وما ترك اشي فاضي (null).
// اذا في سؤال مش مجاوب (null)، بيطلعلوا شريط أسود من تحت الشاشة (SnackBar) بحكيله "أجب على جميع الأسئلة أولاً".
// اذا كان مطيع وجاوبهم كلهم: بيبلش يصلح السكربت. وبنصنع سكور مؤقت (s) بنزيده. (اذا الجواب الأول يساوي 'البترا' زيد سكور، واذا التاني وادي رم زيد.. الخ).
// وبس يخلص، بغير done = true (يعني تم الانتهاء) وبنحط بمتغير الـ score الأساسي النتيجة وبنعمل تحديث للشاشة (setState).

// بالبداية فوق بـ build، في كود بيحكي (if (done)):
// يعني اذا انتهى الامتحان (done = true):
// بدل ما تعرض الأسئلة بالكامل، اعرض مكانه عبارة "نتيجتك: كذا / 5"، واذا كانت 3 أو فوق بيحكيلو ممتاز، اقل بيحكيلو حاول مجددا، وزر بيعمل إعادة للامتحان (بصفر الـ done والـ score وكل الأجوبة).
```

---

### ملف `screens/rating_screen.dart` (شاشة التقييم والتفاعلية)
شاشة فيها 5 نجوم ذهبية وبوكس تعليق وزر إرسال للتقييم.

```dart
int _rating = 0; // بتحفظ المستخدم كم نجمة اختار (0 يعني ولا اشي)
bool _isSubmitted = false; // بتحفظ هل كبس زر إرسال ولا لسا؟
final TextEditingController _commentController = TextEditingController(); // الريموت الخاص بصندوق النص เพื่อ نقدر نقفض الكلام المكتوب او نمسحه.

// رسمنا 5 نجوم جنب بعض بخطوة وحدة باستخدام حلقة التكرار العكسية (List.generate).
// كل نجمة عبارة عن كبسة بزر. لما تكبس على النجمة رقم 3 مثلاً...
// بنحدث المتغير _rating ليصير 3 وبنعمل setState. 
// الكود تبع رسم النجوم بروح بشيك لكل مساحة فيها نجمة بذكاء: (هل رقم مكاني أصغر من رقم التقييم اللي انكبس؟ اذا آه بلون حالي بلون النجمة الممتلئة، واذا لأ بضل نجمة فاضية مفرغة بس الحواف المعطرة). 
// عشان هيك لما تكبس عالثالثة، بتلون الأولى والثانية والثالثة والباقي فاضي!

// زر الإرسال فيه شرط مبهر بالبرمجة:
// بنسأله (هل التقييم يساوي صفر؟)، اذا آه، بنخلي لون الزر وخاصية الكبس فيه مخفية ومعطلة (null)! عشان نغصبه يقيم عالأقل بنجمة مقبولة. 
// ولما يكبس النجمة بنتحول לـ زر فعال. 
// بس يكبس الزر، بنفعل الـ _isSubmitted لتصير (true) وبترد علينا نفس فكرة الامتحان.
// فوق، اذا كانت _isSubmitted صحيحة، بتختفي شاشة النجوم من الوجود وبتتحول لشاشة "شكرًا لك" مع زر الرجوع للخلف اللي بيرجع بصفر كل اشي ليرجع يقيم من جديد!
```

## الخلاصة للمبتدئ وببساطة:
1. **`import`**: بننادي ناس (أو ملفات) يساعدونا لنرتب كودنا.
2. **`StatelessWidget`**: شاشة زي الصبة، ما بتتغير ولا فيها حيوية (زي صورة ونص ترحيبي).
3. **`StatefulWidget`**: شاشة حية بتتفاعل وتنبعث مع كل حركه بتعملها (زي النجوم اللي بتتلون بس تكبسها).
4. **`setState`**: كلمة السر اللي بتخلي الشاشة تحس إنه في اشي تغير وتنمسح وترجع تنرسم بسرعة البرق بالقيم والألوان الجديدة.
5. **`Navigator`**: التاكسي اللي بينقلك من شاشة لشاشة بالتطبيق!
6. **`pubspec.yaml`**: هوية وتذكرة سفر البرنامج لبره.

-- تمت كتابة هادا الشرح بالحب لضمان الاستيعاب الكامل كـ BTEC Student - بتوفيق الله!
