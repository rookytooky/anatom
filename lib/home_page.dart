import 'package:flutter/material.dart';

// الصفحة الرئيسية بعد تسجيل الدخول
class HomePage extends StatelessWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 39, 107),
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
          ' Human body for kids  ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(255, 255, 255, 1)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.child_care,
                    color: Colors.white,
                    size: 80,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Hi $userName',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 179, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.08,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Are you ready to explore the human body?',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 179, 0),
                      fontSize: screenWidth * 0.06,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/imageSwap');
                    },
                    child: Container(
                      width: screenWidth * 0.7,
                      height: screenWidth * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15.0,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.asset(
                          'images/loginn.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/imageSwap');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.18,
                        vertical: screenHeight * 0.015,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textStyle: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                      elevation: 12,
                      backgroundColor: const Color.fromARGB(255, 255, 196, 0),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(' Let’s go'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
