import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  // متغير للتحكم في مشغل الفيديو
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    // تهيئة الفيديو من ملفات التطبيق (ved.mp4)
    _controller = VideoPlayerController.asset('assets/video/ved.mp4')
      ..initialize().then((_) {
        // تحديث الواجهة عند الانتهاء من التهيئة
        setState(() {});
      });
  }

  @override
  void dispose() {
    // إيقاف المشغل عند الخروج من الشاشة لتوفير الموارد
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jordan Explorer'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // مستطيل عرض الفيديو
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black12,
                ),
                clipBehavior: Clip.hardEdge,
                child: _controller != null && _controller!.value.isInitialized
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          // ويدجت عرض الفيديو
                          AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: VideoPlayer(_controller!),
                          ),
                          // زر تكبير الفيديو (Fullscreen) في الزاوية اليمنى العليا
                          Positioned(
                            top: 5,
                            right: 5,
                            child: IconButton(
                              icon: const Icon(Icons.fullscreen, color: Colors.white, size: 30),
                              onPressed: () {
                                _openFullScreenVideo();
                              },
                            ),
                          ),
                          // زر التشغيل والإيقاف الشفاف فوق الفيديو
                          IconButton(
                            iconSize: 60,
                            icon: Icon(
                              _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            onPressed: () {
                              setState(() {
                                _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
                              });
                            },
                          ),
                        ],
                      )
                    : const Center(
                        // مؤشر تحميل في حال تأخر الفيديو
                        child: CircularProgressIndicator(),
                      ),
              ),
              const SizedBox(height: 30),
              // النص التعريفي تحت الفيديو بطريقة تفاعلية
              const Text(
                'يقدم هذا الفيديو التعريفي أشهر المعالم السياحية في الأردن من خلال سلسلة من المقاطع الجذابة، مسلط الضوء على السمات التاريخية والطبيعية لكل موقع. يبدأ الفيديو بمدينة البتراء، إحدى عجائب الدنيا السبع في العالم القديم، ثم ينتقل إلى وادي رم بمناظره الصحراوية الخلابة، وقلعة عجلون، وجبل نيبو، ويليه مدينة جرش الرومانية، مظهراً ثراء الموارد السياحية في الأردن، والتي تشمل المواقع الأثرية والمناظر الطبيعية والمواقع الدينية.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // دالة لعرض الفيديو في وضع ملء الشاشة
  void _openFullScreenVideo() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Stack(
                children: [
                  Center(
                    child: AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    ),
                  ),
                  // زر الخروج من وضع ملء الشاشة
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(Icons.fullscreen_exit, color: Colors.white, size: 35),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  // زر التحكم (تشغيل / إيقاف)
                  Center(
                    child: StatefulBuilder(
                      builder: (context, setDialogState) {
                        return IconButton(
                          iconSize: 80,
                          icon: Icon(
                            _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          onPressed: () {
                            setDialogState(() {
                              _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
                            });
                            // نحدث الشاشة الرئيسية أيضاً لتبقى متزامنة
                            setState(() {}); 
                          },
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
