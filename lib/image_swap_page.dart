import 'package:flutter/material.dart';
import 'slider_drawer.dart';

// صفحة استكشاف جسم الإنسان مع تبديل الصور
class ImageSwapPage extends StatefulWidget {
  const ImageSwapPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageSwapPageState createState() => _ImageSwapPageState();
}

class _ImageSwapPageState extends State<ImageSwapPage> {
  final List<String> _images = [
    'images/man.webp',
    'images/image.png',
    'images/skill.jpg',
    'images/nerv2.jpg',
  ];
  List<String> _captions = [
    'Body structure ',
    ' Muscle structure ',
    ' skeletal structure',
    ' Organ structure',
  ];

  int _currentIndex = 0;

  void _swapImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 50, 84),
                Color.fromARGB(255, 255, 33, 44)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          ' Exploring the structures of the human body',
          style: TextStyle(
            color: Colors.white, // اللون الذي تريده
          ),
        ),
      ),
      drawer: const SliderDrawer(),
      body: Center(
        child: GestureDetector(
          onTap: _swapImage,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: const Color.fromARGB(255, 0, 0, 0),
                child: ClipRRect(
                  child: Image.asset(
                    _images[_currentIndex],
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.7,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _captions[_currentIndex],
                style: const TextStyle(
                  color: Colors.white, // تعيين اللون الأبيض للنص
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
