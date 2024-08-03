import 'package:flutter/material.dart';
import 'package:login/Reserve.dart';
import 'package:login/about_us.dart';
import 'package:login/editPage.dart';
import 'package:login/homePage.dart';
import './model.dart';
import 'manageDB.dart';

class output extends StatefulWidget {
  @override
  State<output> createState() => _OutputState();
}

class _OutputState extends State<output> {
  manageDB db = manageDB();

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
                style: TextStyle(fontSize: 17, color: Colors.white),
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
                    SizedBox(width: 4.5),
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
                    SizedBox(width: 4.5),
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
                    SizedBox(width: 4.5),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<userDB>>(
        future: db.getAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                userDB user = snapshot.data![index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDetail(user);
                      },
                      child: ListTile(
                        title: Text(
                          '${user.NameAndSurname}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ประเภทตู้สินค้า\t: ${user.selectedContainerType}',
                                style: TextStyle(fontFamily: 'Noto Sans Thai'),
                              ),
                              Text(
                                'น้ำหนักสินค้า\t: ${user.weight}',
                                style: TextStyle(fontFamily: 'Noto Sans Thai'),
                              ),
                              Text(
                                'ประเทศปลายทาง\t: ${user.selectedDestination}',
                                style: TextStyle(fontFamily: 'Noto Sans Thai'),
                              ),
                              Text(
                                'ระยะทาง\t: ${user.distance}',
                                style: TextStyle(fontFamily: 'Noto Sans Thai'),
                              ),
                              Text(
                                'ยอดรวม\t: ${user.totalPrice}',
                                style: TextStyle(fontFamily: 'Noto Sans Thai'),
                              ),
                              Text('Contract :',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  Text(
                                    '${user.PhoneNumber}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '${user.Email}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        trailing: Container(
                          width: 70,
                          child: Row(
                            children: [
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            editPage(user: user),
                                        settings:
                                            RouteSettings(arguments: user),
                                      ),
                                    ).then((_) {
                                      setState(() {
                                        db.getAllData();
                                      });
                                    });
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    deleteDialog(user);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      // เส้นขีดกั้นสีฟ้า
                      color: Colors.blue,
                      thickness: 1.5,
                      height: 1.0,
                    ),
                  ],
                );
              }),
            );
          } else {
            return Center(
                child: Text('No data',
                    style: TextStyle(fontFamily: 'Noto Sans Thai')));
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[700],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Logout Success',
                          style: TextStyle(fontFamily: 'Noto Sans Thai')),
                      content: Text('Please press OK to logout',
                          style: TextStyle(fontFamily: 'Noto Sans Thai')),
                      actions: [
                        TextButton(
                          onPressed: () {
                            signUserOut();
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text('OK',
                              style: TextStyle(fontFamily: 'Noto Sans Thai')),
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

  void deleteDialog(userDB user) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Are you sure to delete?',
              style: TextStyle(fontFamily: 'Noto Sans Thai')),
          actions: [
            TextButton(
              onPressed: () {
                db.deleteData(user);
                setState(() {});
                Navigator.pop(context);
              },
              child: Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text('Delete',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Noto Sans Thai')),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                    color: Colors.green, fontFamily: 'Noto Sans Thai'),
              ),
            ),
          ],
        );
      },
    );
  }

  void showDetail(userDB user) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(249, 239, 219, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Container(
            height: 200,
            child: Column(
              children: [
                Center(
                  child: Text(
                    '${user.Email}',
                    style:
                        TextStyle(fontSize: 25, fontFamily: 'Noto Sans Thai'),
                  ),
                ),
                Text(
                  '${user.NameAndSurname}',
                  style: TextStyle(fontSize: 15, fontFamily: 'Noto Sans Thai'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
