import 'package:flutter/material.dart';
import 'slider_drawer.dart';
import 'DisplayPage.dart';

class SectionsPage extends StatefulWidget {
  const SectionsPage({super.key});

  @override
  State<SectionsPage> createState() => _SectionsPageState();
}

class _SectionsPageState extends State<SectionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 50, 84),
        title: const Text(
          '   Anatomy System',
          style: TextStyle(
            color: Colors.white, // اللون الذي تريده
          ),
        ),
      ),
      drawer: SliderDrawer(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        setLocale: (Locale) {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              buildSectionItem(
                context,
                'images/man.jpg',
                'Integumentary System',
                'images/human.jpg',
              ),
              const SizedBox(height: 20),
              buildSectionItem(
                context,
                'images/b.jpg',
                'Muscular System',
                'images/mucsle.jpg',
              ),
              const SizedBox(height: 20),
              // الأقسام بشكل طولي
              buildSectionItem(
                context,
                'images/a.jpg',
                'Skeletal System',
                'images/skilli.jpg',
              ),

              const SizedBox(height: 20),
              buildSectionItem(
                context,
                'images/c.jpg',
                'Cardiovascular System',
                'images/core.jpg',
              ),
              const SizedBox(height: 20),
              buildSectionItem(
                context,
                'images/d.jpg',
                'Digestive System',
                'images/digestive.jpg',
              ),

              const SizedBox(height: 20),
              buildSectionItem(
                context,
                'images/ff.jpg',
                'Nervous System',
                'images/nerv.jpg',
              ),
              const SizedBox(height: 20),

              buildSectionItem(
                context,
                'images/fffff.jpg',
                'Urinary System',
                'images/urin.jpg',
              ),
              const SizedBox(height: 20),
              buildSectionItem(
                context,
                'images/ffffff.jpg',
                'Female Reproductive System',
                'images/femalep.jpg',
              ),
              const SizedBox(height: 20),
              buildSectionItem(
                context,
                'images/fffffff.jpg',
                'Male Reproductive System',
                'images/malep.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionItem(
      BuildContext context, String imagePath, String title, String newImage) {
    return GestureDetector(
      onTap: () {
        // عند الضغط على العنصر، سيتم إرسال صورة جديدة
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DisplayPage(
              imagePath: newImage, // صورة جديدة سيتم عرضها
              title: title, // العنوان
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 130, 130, 130).withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath, // صورة المعاينة
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
