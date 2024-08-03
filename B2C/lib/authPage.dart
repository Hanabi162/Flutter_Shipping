import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/homePage.dart';
import 'package:login/loginPage.dart';

class authPage extends StatelessWidget {
  const authPage({super.key});
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(
      //     child: Text('Firebase Auth', style: TextStyle(color: Colors.white)),
      //   ),
      //   actions: [Icon(Icons.help, color: Colors.white)],
      //   backgroundColor: Color.fromRGBO(40, 84, 48, 1),
      // ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return homePage();
          } else {
            return loginPage();
          }
        },
      ),
    );
  }
}
