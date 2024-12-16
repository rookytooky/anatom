import 'package:flutter/material.dart';

// صفحة تسجيل الدخول
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 76, 127),
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
          'Login ',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 66, 64, 64),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Container(
                height: 340, // ارتفاع الصورة
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/gifbody.gif'),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    /* Text(
                     'مرحباً بكم في تطبيق تعليم جسم الإنسان',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),*/
                    SizedBox(height: screenHeight * 0.5),
                    _buildInputField(
                      controller: _userNameController,
                      labelText: ' User name',
                      icon: Icons.person,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    _buildInputField(
                      controller: _passwordController,
                      labelText: 'Password ',
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    _isLoading
                        ? const CircularProgressIndicator(
                            color: Color.fromARGB(255, 255, 151, 15),
                          )
                        : ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.2,
                                vertical: screenHeight * 0.02,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              textStyle: TextStyle(
                                fontSize: screenWidth * 0.05,
                              ),
                              elevation: 10,
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 179, 0),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Login '),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Color.fromARGB(255, 255, 203, 0)),
          prefixIcon: Icon(icon, color: const Color.fromARGB(255, 255, 203, 0)),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return ' please enter the $labelText';
          }
          return null;
        },
      ),
    );
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacementNamed(
          // ignore: use_build_context_synchronously
          context,
          '/home',
          arguments: _userNameController.text,
        );
      });
    }
  }
}
