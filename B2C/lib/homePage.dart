import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/Reserve.dart';
import 'package:login/about_us.dart';
import 'package:login/authPage.dart';
import 'package:login/output.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 25, 118, 210),
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homePage()));
              },
              child: Text(
                'ShippingB2S',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => about()));
                      },
                      child: Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 10.5,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        minimumSize: Size(50, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        side: BorderSide(color: Colors.white),
                        primary: Colors.white,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(width: 3.5),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => output())));
                      },
                      child: Text(
                        'My Orders',
                        style: TextStyle(
                          fontSize: 10.5,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        minimumSize: Size(50, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        side: BorderSide(color: Colors.white),
                        primary: Colors.white,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(width: 3.5),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Reserve()));
                      },
                      child: Text(
                        'Reserve',
                        style: TextStyle(
                          fontSize: 10.5,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        minimumSize: Size(50, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        side: BorderSide(color: Colors.white),
                        primary: Colors.white,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 450,
                  height: 232,
                  child: Image.network(
                      'https://cdn.discordapp.com/attachments/1180569234594611200/1211594624217649164/ship_-_32052_1440p_online-video-cutter.com_1_1.gif?ex=65eec46c&is=65dc4f6c&hm=f266859202e1b9a26a449bcf5eafcd4cc9f72b7e2332eadd701fa954ab0e124d&'),
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black.withOpacity(0.5),
                        onPrimary: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Reserve()));
                      },
                      child: Text(
                        'Reserve a Container',
                        style:
                            TextStyle(fontFamily: 'NotoSansThai', fontSize: 17),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 400,
                  width: 1000,
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      ListTile(
                        leading: Image.network(
                          'https://cdn.pixabay.com/photo/2018/01/30/13/28/container-3118783_1280.jpg',
                          width: 75,
                          height: 80,
                        ),
                        title: Text(
                          'สาระน่ารู้พื้นฐานเกี่ยวกับตู้คอนเทนเนอร์',
                          style: TextStyle(
                            fontFamily: 'NotoSansThai',
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Text(
                          '\nตู้คอนเทนเนอร์ (Container Box) คือ  ตู้ที่ถูกออกแบบมาเพื่อใช้สำหรับบรรจุสินค้านำเข้าและส่งออกทางทะเล',
                          style: TextStyle(
                              fontFamily: 'NotoSansThai', fontSize: 11),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            launcher.launchUrl(Uri.parse(
                                'https://www.xn--12cfao9difncba6htaa4ipbe3fclb6lna1nc1r5a8gj.com/TH/Blog/detail/1?fbclid=IwAR1nntyMajFflnh-UL2dhts-Um1jgGFTHffcvV5f_zd3nYdzbK20bs8u9MA'));
                          },
                          child: Container(
                            child: Text(
                              'View',
                              style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: 15,
                                  fontFamily: 'NotoSansThai'),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ListTile(
                        leading: Image.network(
                          'https://cdn.pixabay.com/photo/2021/09/30/17/54/port-6670684_1280.jpg',
                          width: 75,
                          height: 80,
                        ),
                        title: Text(
                          'สาระน่ารู้เกี่ยวกับเรือขนส่งสินค้า',
                          style: TextStyle(
                              fontFamily: 'NotoSansThai', fontSize: 15),
                        ),
                        subtitle: Text(
                          '\nเรือขนส่งสินค้า เป็นเรือที่ใช้สำหรับการบรรทุกสินค้าทั่วไป ไม่จำเป็นต้องมีสินค้าอย่างใดอย่างหนึ่ง อาจบรรทุกสินค้าที่เป็นหีบห่อหรือไม่เป็นหีบห่อก็ได้',
                          style: TextStyle(
                            fontFamily: 'NotoSansThai',
                            fontSize: 11,
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            launcher.launchUrl(Uri.parse(
                                'https://www.at-once.info/th/blog/how-many-types-of-cargo-ships-are-there'));
                          },
                          child: Container(
                            child: Text(
                              'View',
                              style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: 15,
                                  fontFamily: 'NotoSansThai'),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue[700],
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF1976D2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Logout Success',
                        style: TextStyle(fontFamily: 'NotoSansThai'),
                      ),
                      content: Text(
                        'Please press OK to logout.',
                        style: TextStyle(fontFamily: 'NotoSansThai'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            signUserOut();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => authPage()));
                          },
                          child: Text(
                            'OK',
                            style: TextStyle(fontFamily: 'NotoSansThai'),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 10, fontFamily: 'NotoSansThai'),
              ),
              style: TextButton.styleFrom(
                minimumSize: Size(50, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                side: BorderSide(color: Colors.white),
                primary: Colors.white,
                backgroundColor: Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
}
