import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forgotPasswordPage extends StatefulWidget {
  const forgotPasswordPage({super.key});

  @override
  State<forgotPasswordPage> createState() => _forgotPasswordPageState();
}

class _forgotPasswordPageState extends State<forgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            '',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 25, 118, 210),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
              ),
              Text(
                'Enter your email to get a password reset link',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Noto Sans Thai'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your email',
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'กรุณากรอก email';
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  passwordReset();
                },
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Noto Sans Thai'),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 63, 153, 205)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
