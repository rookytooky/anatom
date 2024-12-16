import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayPage extends StatelessWidget {
  final String imagePath; // مسار الصورة الجديدة
  final String title; // العنوان

  const DisplayPage({
    super.key,
    required this.imagePath,
    required this.title,
  });

  // دالة لعرض معلومات عن النظام
  void _showSystemInfo(BuildContext context, String systemTitle) {
    String info = '';
    String videoUrl = '';

    switch (systemTitle) {
      case 'Integumentary System':
        info =
            'The integumentary system includes the skin, hair, nails, and glands. It serves as the body’s outer protective layer and plays several critical roles in maintaining overall health.';
        videoUrl = 'https://www.youtube.com/watch?v=SqI-NMDeLa8';
        break;
      case 'Skeletal System':
        info =
            'The skeletal system includes all of the bones and joints in the body. Each bone is a complex living organ that is made up of many cells, protein fibers, and minerals. The skeletal system in an adult body is made up of 206 individual bones.';
        videoUrl =
            'https://www.youtube.com/watch?v=SiBzCpg6vu8&list=PLZS3MUjYqjUHI83ftKiBe7TJYMutAHx_e&index=1';
        break;
      case 'Muscular System':
        info =
            'The muscular system is responsible for the movement of the human body. Attached to the bones of the skeletal system are about 700 named muscles that make up roughly half of a persons body weight.';
        videoUrl =
            'https://www.youtube.com/watch?v=UGSi_HwgX0k&list=PLZS3MUjYqjUHI83ftKiBe7TJYMutAHx_e&index=2';
        break;
      case 'Cardiovascular System':
        info =
            'The cardiovascular system includes the heart and blood vessels, responsible for circulating blood throughout the body.';
        videoUrl =
            'https://www.youtube.com/watch?v=aUOQqoPsaBg&list=PLZS3MUjYqjUHI83ftKiBe7TJYMutAHx_e&index=3';
        break;
      case 'Digestive System':
        info =
            'The digestive system breaks down food into nutrients for absorption and eliminates waste from the body.';
        videoUrl =
            'https://www.youtube.com/watch?v=sysfVUfswAA&list=PLZS3MUjYqjUHI83ftKiBe7TJYMutAHx_e&index=4';
        break;
      case 'Nervous System':
        info =
            'The nervous system controls the body’s movements and activities by transmitting electrical signals between the brain, spinal cord, and nerves.';
        videoUrl =
            'https://www.youtube.com/watch?v=5FZI4Oht6eg&list=PLZS3MUjYqjUHI83ftKiBe7TJYMutAHx_e&index=8';
        break;
      case 'Urinary System':
        info =
            'The urinary system removes waste products from the blood and maintains the balance of fluids and electrolytes.';
        videoUrl =
            'https://www.youtube.com/watch?v=s6XJdxlRB2E&list=PLZS3MUjYqjUHI83ftKiBe7TJYMutAHx_e&index=7';
        break;
      case 'Female Reproductive System':
        info =
            'The female reproductive system produces eggs and supports the development of a fetus during pregnancy.';
        videoUrl = 'https://www.youtube.com/watch?v=2NjzlvAV1lc';
        break;
      case 'Male Reproductive System':
        info =
            'The male reproductive system produces sperm and facilitates the fertilization of the female egg.';
        videoUrl =
            'https://www.youtube.com/watch?v=Vxwyp3EH4L8&list=PLexagO6P8kJfLanjIInIViMwfIWIz3vW7&index=67';
        break;
      default:
        info = 'No information available.';
        videoUrl = '';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(systemTitle),
          content: SingleChildScrollView(
            child: Text(info),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
            if (videoUrl.isNotEmpty)
              TextButton(
                onPressed: () async {
                  final Uri url = Uri.parse(videoUrl);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Could not launch video.'),
                      ),
                    );
                  }
                },
                child: const Text('Watch Video'),
              ),
          ],
        );
      },
    );

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: ElevatedButton(
            onPressed: () => _showSystemInfo(context, title),
            child: const Text('Show Info'),
          ),
        ),
      );
    }
  }

  // دالة للانتقال إلى صفحة جديدة عند النقر على مناطق الصورة
  void _navigateToNewPage(
      BuildContext context, String newImagePath, String newTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            DisplayPage(imagePath: newImagePath, title: newTitle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 50, 84),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              _showSystemInfo(context, title);
            },
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            InteractiveViewer(
              minScale: 0.5,
              maxScale: 4.0,
              child: Image.asset(
                imagePath,
                width: 500,
                height: 500,
                fit: BoxFit.contain,
              ),
            ),

            // عرض مناطق النقر فقط في حالة Skeletal System
            if (title == 'Skeletal System') ...[
              Positioned(
                left: 180, // تعديل الموقع
                top: 80, // تعديل الموقع
                width: 40,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/shh.jpg', 'face');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 140, // تعديل الموقع
                top: 170, // تعديل الموقع
                width: 40,
                height: 100,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/hhs.jpg', 'hand');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 230, // تعديل الموقع
                top: 160, // تعديل الموقع
                width: 30,
                height: 130,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/hhs.jpg', 'hand');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 180, // تعديل الموقع
                top: 300, // تعديل الموقع
                width: 40,
                height: 150,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/leg.jpg', 'leg');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 170, // تعديل الموقع
                top: 150, // تعديل الموقع
                width: 70,
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/rib.jpg', 'chest');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 170, // تعديل الموقع
                top: 220, // تعديل الموقع
                width: 60,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/llium.jpg', 'chest');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // خلفية شفافة
                    ),
                  ),
                ),
              ),
            ] else if (title == 'Integumentary System') ...[
              Positioned(
                left: 180, // تعديل الموقع
                top: 80, // تعديل الموقع
                width: 40,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/face.jpg', 'face');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 170, // تعديل الموقع
                top: 130, // تعديل الموقع
                width: 60,
                height: 100,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/che.jpg', 'chest');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 140, // تعديل الموقع
                top: 150, // تعديل الموقع
                width: 40,
                height: 120,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/arms.jpg', 'chest');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 220, // تعديل الموقع
                top: 150, // تعديل الموقع
                width: 40,
                height: 120,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/arms.jpg', 'chest');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 170, // تعديل الموقع
                top: 240, // تعديل الموقع
                width: 60,
                height: 190,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/legs.jpg', 'chest');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // خلفية شفافة
                    ),
                  ),
                ),
              ),
            ] else if (title == 'Muscular System') ...[
              Positioned(
                left: 140, // تعديل الموقع
                top: 80, // تعديل الموقع
                width: 40,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/faceMuc.jpg', 'face');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 140, // تعديل الموقع
                top: 140, // تعديل الموقع
                width: 40,
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(
                        context, 'images/mucleChest.jpg', 'chest');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 245, 145, 145), // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 250, // تعديل الموقع
                top: 140, // تعديل الموقع
                width: 40,
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/backmu.jpg', 'back');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 245, 145, 145), // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 110, // تعديل الموقع
                top: 150, // تعديل الموقع
                width: 20,
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/handmuc.jpg', 'hand');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 245, 145, 145), // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 180, // تعديل الموقع
                top: 150, // تعديل الموقع
                width: 20,
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/handmuc.jpg', 'hand');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 245, 145, 145), // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 220, // تعديل الموقع
                top: 150, // تعديل الموقع
                width: 20,
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/handmuc.jpg', 'hand');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 245, 145, 145), // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 290, // تعديل الموقع
                top: 150, // تعديل الموقع
                width: 20,
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/handmuc.jpg', 'hand');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 245, 145, 145), // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 130, // تعديل الموقع
                top: 240, // تعديل الموقع
                width: 60,
                height: 100,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/legmuc.jpg', 'legs');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 245, 145, 145), // خلفية شفافة
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 240, // تعديل الموقع
                top: 240, // تعديل الموقع
                width: 60,
                height: 100,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/legmuc.jpg', 'legs');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 245, 145, 145), // خلفية شفافة
                    ),
                  ),
                ),
              ),
            ] else if (title == 'Cardiovascular System') ...[
              Positioned(
                left: 180, // تعديل الموقع
                top: 140, // تعديل الموقع
                width: 40,
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    _navigateToNewPage(context, 'images/anahart.jpg', 'face');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent, // خلفية شفافة
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
