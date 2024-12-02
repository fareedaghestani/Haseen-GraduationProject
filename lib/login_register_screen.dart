import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class LoginRegisterScreen extends StatelessWidget {
  const LoginRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // الخلفية
          Positioned.fill(
            child: Image.asset(
              'assets/wall.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // المحتوى
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // الجزء العلوي: الشعار والنص التوضيحي
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // الشعار
                    Hero(
                      tag: 'logo',
                      child: Image.asset(
                        'assets/حصين.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // النص التوضيحي
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        'مرحبًا بكم في لعبتنا التفاعلية للتوعية بالأمن السيبراني حول كلمات المرور القوية والمصادقة الثنائية (2FA)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // الجزء السفلي: الأزرار
              Row(
                children: [
                  // زر تسجيل الدخول
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.green,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.login),
                            SizedBox(width: 10),
                            Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // زر التسجيل
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.app_registration),
                            SizedBox(width: 10),
                            Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
