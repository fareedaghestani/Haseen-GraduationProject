import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          // الخلفية
          Positioned.fill(
            child: Image.asset(
              'assets/wall.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // سهم الرجوع في الأعلى
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context); // الرجوع إلى الشاشة السابقة
                },
              ),
            ),
          ),
          // محتوى الصفحة
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6), // لون مطابق لتسجيل الدخول
                    borderRadius: BorderRadius.circular(20), // زوايا دائرية
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // استبدال العنوان بالصورة
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Image.asset(
                            'assets/انشاء حساب.png', // مسار الصورة
                            width: 200,
                            height: 100,
                          ),
                        ),
                        // حقل الاسم الكامل
                        TextFormField(
                          controller: fullNameController,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            hintText: 'Enter your full name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.1),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        // حقل البريد الإلكتروني
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.1),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        // حقل كلمة المرور
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.1),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // زر التسجيل
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                // تسجيل المستخدم
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );

                                // حفظ البيانات في Firestore
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(userCredential.user?.uid)
                                    .set({
                                  'fullName': fullNameController.text.trim(),
                                  'email': emailController.text.trim(),
                                  'uid': userCredential.user?.uid,
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Registration Successful!')),
                                );

                                // يمكنك توجيه المستخدم هنا
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Error: ${e.toString()}')),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[900], // أخضر داكن
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // النص الخاص بالتسجيل المسبق
                        InkWell(
                          onTap: () {
                            Navigator.pop(context); // العودة لتسجيل الدخول
                          },
                          child: const Text(
                            'Already have an account? Log In',
                            style: TextStyle(
                              color: Colors.black, // أسود
                              fontWeight: FontWeight.bold, // خط عريض
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
