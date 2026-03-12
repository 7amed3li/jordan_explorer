import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// هاد الاشي بشغل التطبيق
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Jordan(), 
    );
  }
}

// الشاشة الرئيسية
class Jordan extends StatefulWidget {
  @override
  _JordanState createState() => _JordanState();
}

class _JordanState extends State<Jordan> {
  int i = 0; // عشان نعرف اي صفحة احنا

  @override
  Widget build(BuildContext context) {
    Widget page = Page1();
    
    // شروط الصفحات (طريقة بدائية بدل المصفوفة)
    if (i == 0) page = Page1();
    if (i == 1) page = Page2();
    if (i == 2) page = Page3();
    if (i == 3) page = Page4();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Jordan Explorer', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true, // رجعناه للنص
        elevation: 0,
      ),
      body: page,
      // البار اللي تحت
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: i,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.list, color: Colors.black), label: 'الأماكن'),
          BottomNavigationBarItem(icon: Icon(Icons.help, color: Colors.black), label: 'اختبر نفسك'), // تعديل اللون للاسود زي الباقي
          BottomNavigationBarItem(icon: Icon(Icons.star, color: Colors.black), label: 'قيّمنا'),
        ],
        onTap: (num) {
          setState(() {
            i = num;
          });
        },
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20),
        Image.asset('assets/images/3.jpeg', height: 250), // رجعنا العرض كامل 
        SizedBox(height: 20),
        Center(
          child: Text(
            'تطبيق اكتشف الأردن',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black), // تعديل اللون للاسود
          ),
        ),
        SizedBox(height: 20),
        Directionality( // تعديل اتجاه النص
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'أهلاً بكم في تطبيقنا، هنا سوف نتجول في الأردن ونرى أجمل الأماكن السياحية ونتعرف على تاريخها العريق.',
              textAlign: TextAlign.center, 
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.all(20), // تعديل البادينج الغريب
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => VidPage()));
            },
            child: Text('شاهد الفيديو', style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ),
      ],
    );
  }
}

class VidPage extends StatefulWidget {
  @override
  _VidPageState createState() => _VidPageState();
}

class _VidPageState extends State<VidPage> {
  var control = VideoPlayerController.asset('assets/video/ved.mp4');

  @override
  void initState() {
    super.initState();
    control.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() { // تعديل نسيان مسح الفيديو
    control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفيديو', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: ListView( 
        children: [
          SizedBox(height: 50),
          if (control.value.isInitialized)
            Container(
              height: 250, 
              child: VideoPlayer(control),
            )
          else
            Container(
              height: 250,
              color: Colors.grey, 
              child: Center(child: Text('جاري التحميل...')),
            ),
          
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green), 
                onPressed: () {
                  setState(() {
                    control.play();
                  });
                },
                child: Text('شغّل', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red), 
                onPressed: () {
                  setState(() {
                    if (control.value.isPlaying) { // تعديل الحماية زر التوقيف
                      control.pause(); 
                    }
                  });
                },
                child: Text('إيقاف', style: TextStyle(color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Center(child: Text('الأماكن الرائعة', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold))),
        SizedBox(height: 20), 

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFE8D5C0),
            padding: EdgeInsets.all(15) 
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Details(
              name: 'البتراء',
              img1: 'assets/images/1.jpeg',
              img2: 'assets/images/3.jpeg',
              desc: 'البتراء من عجائب الدنيا السبع وموجودة لدينا، والجميع يسمونها المدينة الوردية.',
            )));
          },
          child: Text('البتراء', style: TextStyle(fontSize: 18, color: Colors.black)),
        ),
        SizedBox(height: 15),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFE8D5C0),
            padding: EdgeInsets.all(15)
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Details(
              name: 'جرش',
              img1: 'assets/images/4.jpeg',
              img2: 'assets/images/15.jpeg',
              desc: 'جرش هذه مدينة أثرية للرومان، تجدها في شمال الأردن وآثارها تأخذ العقل.', // تعديل املائي
            )));
          },
          child: Text('جرش', style: TextStyle(fontSize: 18, color: Colors.black)),
        ),
        SizedBox(height: 15),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFE8D5C0),
            padding: EdgeInsets.all(15)
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Details(
              name: 'وادي رم',
              img1: 'assets/images/6.jpeg',
              img2: 'assets/images/11.jpeg',
              desc: 'وادي رم، أجمل صحاري العالم ويسمونه وادي القمر.',
            )));
          },
          child: Text('وادي رم', style: TextStyle(fontSize: 18, color: Colors.black)), // تعديل اسم الزر
        ),
        SizedBox(height: 15),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFE8D5C0),
            padding: EdgeInsets.all(15)
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Details(
              name: 'جبل نيبو',
              img1: 'assets/images/8.jpeg',
              img2: 'assets/images/10.jpeg',
              desc: 'جبل نيبو مكان تاريخي يطل على البحر الميت، المنظر من هناك شيء غير طبيعي.',
            )));
          },
          child: Text('جبل نيبو', style: TextStyle(fontSize: 18, color: Colors.black)),
        ),
        SizedBox(height: 15),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFE8D5C0),
            padding: EdgeInsets.all(15)
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Details(
              name: 'قلعة عجلون',
              img1: 'assets/images/7.jpeg',
              img2: 'assets/images/5.jpeg',
              desc: 'قلعة عجلون بناها المسلمون قديماً لحماية المنطقة، ومن يصعد إليها يرى كل الدنيا.',
            )));
          },
          child: Text('قلعة عجلون', style: TextStyle(fontSize: 18, color: Colors.black)),
        ),
      ],
    );
  }
}

class Details extends StatelessWidget {
  final String name;
  final String img1;
  final String img2;
  final String desc;

  Details({required this.name, required this.img1, required this.img2, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Image.asset(img1),
          SizedBox(height: 10), 
          Image.asset(img2),
          SizedBox(height: 20),
          Directionality( // تعديل اتجاه النص
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsets.all(15), 
              child: Text(desc, style: TextStyle(fontSize: 18)), 
            ),
          )
        ],
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  String q1 = '';
  String q2 = '';
  String q3 = '';
  String q4 = '';
  String q5 = '';
  
  bool isDone = false;
  int mark = 0;

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('علامتك: $mark من 5', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                setState(() {
                  isDone = false;
                  // تعديل الاخطاء المنطقية وتصفير الاختبار صح
                  mark = 0;
                  q1 = ''; 
                  q2 = '';
                  q3 = '';
                  q4 = '';
                  q5 = '';
                });
              },
              child: Text('أعد الاختبار', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      );
    }

    return ListView(
      padding: EdgeInsets.all(20), 
      children: [
        Center(child: Text('هيا نختبر معلوماتك', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
        SizedBox(height: 20),

        Directionality( // تعديل الاتجاه
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // تعديل النص
            children: [
              Text('١- ما هي المدينة التي تلقب بالوردية؟', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              RadioListTile(
                title: Text('البتراء'), value: 'A', groupValue: q1,
                onChanged: (v) { setState(() { q1 = v.toString(); }); },
              ),
              RadioListTile(
                title: Text('جرش'), value: 'B', groupValue: q1,
                onChanged: (v) { setState(() { q1 = v.toString(); }); },
              ),
              RadioListTile(
                title: Text('عمان'), value: 'C', groupValue: q1,
                onChanged: (v) { setState(() { q1 = v.toString(); }); },
              ),
              Divider(),

              Text('٢- أين يقع وادي رم بالضبط؟', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              RadioListTile(
                title: Text('في الشمال'), value: 'A', groupValue: q2,
                onChanged: (v) { setState(() { q2 = v.toString(); }); },
              ),
              RadioListTile(
                title: Text('في الجنوب'), value: 'B', groupValue: q2,
                onChanged: (v) { setState(() { q2 = v.toString(); }); },
              ),
              RadioListTile( // تعديل الخيار المنسي
                title: Text('في الشرق'), value: 'C', groupValue: q2,
                onChanged: (v) { setState(() { q2 = v.toString(); }); },
              ),
              Divider(),

              Text('٣- أين تجد أجمل آثار للرومان؟', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              RadioListTile(
                title: Text('البحر الميت'), value: 'A', groupValue: q3,
                onChanged: (v) { setState(() { q3 = v.toString(); }); },
              ),
              RadioListTile( // تعديل الخيار المنسي
                title: Text('البتراء'), value: 'B', groupValue: q3,
                onChanged: (v) { setState(() { q3 = v.toString(); }); },
              ),
              RadioListTile(
                title: Text('جرش'), value: 'C', groupValue: q3,
                onChanged: (v) { setState(() { q3 = v.toString(); }); },
              ),
              Divider(),

              Text('٤- ما هو المكان الذي يطل على البحر الميت؟', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              RadioListTile(
                title: Text('جبل نيبو'), value: 'A', groupValue: q4,
                onChanged: (v) { setState(() { q4 = v.toString(); }); },
              ),
              RadioListTile(
                title: Text('قلعة عجلون'), value: 'B', groupValue: q4,
                onChanged: (v) { setState(() { q4 = v.toString(); }); },
              ),
              RadioListTile( // الخيار الثالث
                title: Text('جرش'), value: 'C', groupValue: q4,
                onChanged: (v) { setState(() { q4 = v.toString(); }); },
              ),
              Divider(),

              Text('٥- أي قلعة بناها المسلمون قديماً للغزوات؟', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              RadioListTile(
                title: Text('البتراء'), value: 'A', groupValue: q5,
                onChanged: (v) { setState(() { q5 = v.toString(); }); },
              ),
              RadioListTile(
                title: Text('قلعة عجلون'), value: 'B', groupValue: q5,
                onChanged: (v) { setState(() { q5 = v.toString(); }); },
              ),
              RadioListTile(
                title: Text('جرش'), value: 'C', groupValue: q5,
                onChanged: (v) { setState(() { q5 = v.toString(); }); },
              ),
            ],
          ),
        ),
        
        SizedBox(height: 20), 
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black, padding: EdgeInsets.all(15)),
          onPressed: () {
            // تعديل حماية السماح لمن ترك اسئلة فارغه
            if (q1 == '' || q2 == '' || q3 == '' || q4 == '' || q5 == '') {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('الرجاء الإجابة على جميع الأسئلة')));
            } else {
              mark = 0;
              if (q1 == 'A') mark = mark + 1; // البتراء
              if (q2 == 'B') mark = mark + 1; // الجنوب
              if (q3 == 'C') mark = mark + 1; // جرش
              if (q4 == 'A') mark = mark + 1; // جبل نيبو
              if (q5 == 'B') mark = mark + 1; // قلعة عجلون

              setState(() {
                isDone = true;
              });
            }
          },
          child: Text('اعتماد الإجابات', style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ],
    );
  }
}

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  String myText = '';
  // حذفنا المتغير x اللي كان موجود بدون فايدة

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        SizedBox(height: 30),
        Center(child: Text('أخبرنا برأيك:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
        SizedBox(height: 20), 
        Directionality( // تعديل الاتجاه
          textDirection: TextDirection.rtl,
          child: TextField(
            onChanged: (v) {
              myText = v;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'اكتب ما بخاطرك...',
            ),
            maxLines: 4,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black, padding: EdgeInsets.all(15)),
          onPressed: () {
            // توفير شرط عدم السماح بارسال فاضي
            if (myText.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('الرجاء كتابة تعليق')));
              return;
            }
            setState(() {
              myText = 'وصل تعليقك، شكراً لك!';
            });
          },
          child: Text('إرسال الرأي', style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
        SizedBox(height: 30),
        Center(child: Text(myText, style: TextStyle(fontSize: 18, color: Colors.green))), // تعديل اللون للون الاخضر بدل الازرق
      ],
    );
  }
}
