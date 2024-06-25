import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:proyecto_sw1_movil/src/config/environment/environment.dart'; // Importa Environment

class WordDetailScreen extends StatefulWidget {
  final String category;
  final String gifPath;

  const WordDetailScreen(
      {Key? key, required this.category, required this.gifPath})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WordDetailScreenState createState() => _WordDetailScreenState();
}

class _WordDetailScreenState extends State<WordDetailScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    final String baseUrl = Environment.apiUrl;
    final String videoUrl =
        '$baseUrl/storage/videos/${widget.category}/${widget.gifPath}';

    print('Video URL: $videoUrl'); // Mensaje de depuración

    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      }).catchError((error) {
        print('Error initializing video player: $error'); // Mensaje de depuración
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de la Letra'),
        backgroundColor: const Color(0xFF004D40),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
