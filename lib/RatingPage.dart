import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rate the app',
          style: TextStyle(
            color: Colors.white, // تغيير لون النص إلى الأبيض
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 13, 82),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please rate the app:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.orangeAccent,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // يمكنك إضافة أي إجراء هنا بعد التقييم
                Navigator.pop(context);
              },
              child: const Text('Submit Rating'),
            ),
          ],
        ),
      ),
    );
  }
}
