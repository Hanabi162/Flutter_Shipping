import 'package:firebase_core/firebase_core.dart';
import './authPage.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 60,
        ),
        Container(
          height: 140,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'B2C Shipping Container',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoSansThai',
                color: Colors.blue[700],
              ),
            ),
          ),
        ),
        Container(
          height: 290,
          child: Image.network(
              'https://cdn.pixabay.com/photo/2021/12/06/10/55/hamburg-6849995_1280.jpg'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Container(
            child: AnimatedTextKit(animatedTexts: [
              TyperAnimatedText(
                'ยินดีต้อนรับสู่ B2C',
                textStyle: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Noto Sans Thai',
                  color: Colors.blue[700],
                ),
                speed: const Duration(milliseconds: 110),
              ),
              TyperAnimatedText(
                'นี่คือ App สั่งจองตู้ Container',
                textStyle: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Noto Sans Thai',
                  color: Colors.blue[700],
                ),
                speed: const Duration(milliseconds: 110),
              ),
              TyperAnimatedText(
                'พวกเราหวังว่า จะได้สิ่งที่ต้องการจาก App นี้',
                textStyle: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Noto Sans Thai',
                  color: Colors.blue[700],
                ),
                speed: const Duration(milliseconds: 110),
              ),
            ]),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => authPage()));
        },
        label: Text('Login',
            style: TextStyle(
              color: Colors.white,
              // fontFamily: 'Noto Sans Thai'
            )),
        //backgroundColor: Color.fromRGBO(40, 84, 48, 1),
        backgroundColor: Colors.blue[700],
      ),
    );
  }
}
