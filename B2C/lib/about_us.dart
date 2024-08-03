import 'package:flutter/material.dart';
import 'package:login/Reserve.dart';
import 'package:login/homePage.dart';
import 'package:login/output.dart';
import 'authPage.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _AboutState();
}

class _AboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Column(
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
                          fontSize: 9,
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
                    SizedBox(width: 5.0),
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
                          fontSize: 9,
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
                    SizedBox(width: 5.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Reserve()));
                      },
                      child: Text(
                        'Reserve',
                        style: TextStyle(
                          fontSize: 9,
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
                    SizedBox(width: 5.0),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      body: Container(
        child: Container(
          height: 627, //627
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.network(
                      'https://cdn.pixabay.com/photo/2017/12/15/22/25/hamburg-3021820_960_720.jpg'),
                ),
                SizedBox(height: 47),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'About Us',
                    style: TextStyle(
                        fontFamily: 'Noto Sans Thai',
                        color: Colors.blue[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Anakorn Roumpattana \nPosition : Project Manager,Plan Design UI,Programmer\n',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Noto Sans Thai',
                              color: Colors.blue[700])),
                      SizedBox(height: 1),
                      Text(
                          'Phatsakorn Meesuk \nPosition : Design UI in Figma,Programmer\n',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Noto Sans Thai',
                              color: Colors.blue[700])),
                      SizedBox(height: 1),
                      Text(
                          'Patthaphoom Panpran \nPosition : Programmer,Database Support\n',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Noto Sans Thai',
                              color: Colors.blue[700])),
                      SizedBox(height: 1),
                      Text(
                          'Prarittakorn Sangkhapanich \nPosition : Programmer,Database Management\n',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Noto Sans Thai',
                              color: Colors.blue[700])),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
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
                        style: TextStyle(fontFamily: 'Noto Sans Thai'),
                      ),
                      content: Text(
                        'Please press OK to logout.',
                        style: TextStyle(fontFamily: 'Noto Sans Thai'),
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
                            style: TextStyle(fontFamily: 'Noto Sans Thai'),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 10, fontFamily: 'Noto Sans Thai'),
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
}
