import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// شاشة عرض الفيديو التعريفي
class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    // تحميل الفيديو من ملفات التطبيق
    _controller = VideoPlayerController.asset('assets/video/ved.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    // إيقاف المشغل عند الخروج
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
                color: Colors.black12,
                child: _controller != null && _controller!.value.isInitialized
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          // الفيديو
                          AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: VideoPlayer(_controller!),
                          ),
                          // زر التشغيل والإيقاف
                          IconButton(
                            iconSize: 60,
                            icon: Icon(
                              _controller!.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_controller!.value.isPlaying) {
                                  _controller!.pause();
                                } else {
                                  _controller!.play();
                                }
                              });
                            },
                          ),
                        ],
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
              const SizedBox(height: 30),
              // نص تعريفي تحت الفيديو
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
