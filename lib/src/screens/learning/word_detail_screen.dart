// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:proyecto_sw1_movil/src/config/environment/environment.dart'; // Importa Environment

class WordDetailScreen extends StatefulWidget {
  final String category;
  final String gifPath;
  final String wordName;

  const WordDetailScreen(
      {Key? key, required this.category, required this.gifPath, required this.wordName})
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
        _controller.setVolume(0); // Quitar el sonido
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
        title: Text(
          widget.wordName,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF004D40),
      ),
      body: Stack(
        children: [
          // Fondo decorativo
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFE0F2F1), Color(0xFF004D40)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Burbujas decorativas
          _buildBubble(100, 100, 0.3, const Offset(50, 50)),
          _buildBubble(60, 60, 0.4, const Offset(200, 150)),
          _buildBubble(80, 80, 0.5, const Offset(300, 300)),
          _buildBubble(50, 50, 0.2, const Offset(100, 400)),
          _buildBubble(90, 90, 0.3, const Offset(250, 500)),
          // Contenido principal
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          widget.category,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF004D40),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '¡Dirígete a la sección de Traducción y prueba este gesto!',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF00796B),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: VideoPlayer(_controller),
                            ),
                          ),
                        )
                      : const CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBubble(double width, double height, double opacity, Offset offset) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(opacity),
        ),
      ),
    );
  }
}
