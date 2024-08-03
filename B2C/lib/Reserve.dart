import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/about_us.dart';
import 'package:login/authPage.dart';
import 'package:login/homePage.dart';
import 'package:login/output.dart';
import 'manageDB.dart';
import 'model.dart';

class Reserve extends StatefulWidget {
  @override
  State<Reserve> createState() => _Reserve();
}

class _Reserve extends State<Reserve> {
  String? NameAndSurname;
  String? PhoneNumber;
  String? Email;
  String? selectedContainerType;
  int? weight;
  String? selectedDestination;
  int? distance;
  int? basePriceByWeight;
  int? priceByDistance;
  int? totalPrice;

  @override
  void initState() {
    super.initState();
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    totalPrice = (basePriceByWeight ?? 0) + (priceByDistance ?? 0);
  }

  void caluclatePriceDistance() {}

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
                    SizedBox(width: 3.5),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Name and Surname',
              style: TextStyle(fontFamily: 'Noto Sans Thai'),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  NameAndSurname = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Phone Number',
              style: TextStyle(fontFamily: 'Noto Sans Thai'),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  PhoneNumber = value;
                });
              },
              decoration: InputDecoration(
                hintText: '09xxxxxxxx',
                errorText: isValidPhoneNumber(PhoneNumber)
                    ? null
                    : 'Invalid phone number',
              ),
            ),
            SizedBox(height: 20),
            Text('Email', style: TextStyle(fontFamily: 'Noto Sans Thai')),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  Email = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'example@example.com',
                errorText: isValidEmail(Email) ? null : 'Invalid email format',
              ),
            ),
            SizedBox(height: 20),
            Text('Select Container Type:',
                style: TextStyle(fontFamily: 'Noto Sans Thai')),
            DropdownButtonFormField<String>(
              value: selectedContainerType,
              items: [
                'Dry Container',
                'Reefer Container',
                'Open Top Container',
                'Flat Rack Container',
                'ISO Tank Container',
                'Ventilated Container'
              ]
                  .map((type) => DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedContainerType = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('Enter Weight:',
                style: TextStyle(fontFamily: 'Noto Sans Thai')),
            DropdownButtonFormField<int>(
              value: weight,
              items: [
                DropdownMenuItem<int>(
                  value: 5000,
                  child: Text('5000 kg or less',
                      style: TextStyle(fontFamily: 'Noto Sans Thai')),
                ),
                DropdownMenuItem<int>(
                  value: 10000,
                  child: Text('10001 - 15000 kg',
                      style: TextStyle(fontFamily: 'Noto Sans Thai')),
                ),
                DropdownMenuItem<int>(
                  value: 15000,
                  child: Text('15001 - 20000 kg',
                      style: TextStyle(fontFamily: 'Noto Sans Thai')),
                ),
                DropdownMenuItem<int>(
                  value: 20000,
                  child: Text('20001 - 30000 kg',
                      style: TextStyle(fontFamily: 'Noto Sans Thai')),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  weight = value;
                  if (weight != null) {
                    if (weight! > 0 && weight! <= 5000) {
                      basePriceByWeight = 0;
                    } else if (weight! >= 5001 && weight! <= 10000) {
                      basePriceByWeight = 5000;
                    } else if (weight! >= 10001 && weight! <= 15000) {
                      basePriceByWeight = 10000;
                    } else if (weight! >= 15001 && weight! <= 20000) {
                      basePriceByWeight = 15000;
                    } else if (weight! >= 20001 && weight! <= 30000) {
                      basePriceByWeight = 20000;
                    }
                  }
                  calculateTotalPrice();
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('Base Price By Weight:',
                style: TextStyle(fontFamily: 'Noto Sans Thai')),
            Text(basePriceByWeight != null ? '\$$basePriceByWeight' : 'N/A',
                style: TextStyle(fontFamily: 'Noto Sans Thai')),
            SizedBox(height: 20),
            Text('Select Destination Country:',
                style: TextStyle(fontFamily: 'Noto Sans Thai')),
            DropdownButtonFormField<String>(
              value: selectedDestination,
              items: ['Vietnam', 'China', 'Philippines', 'South Korea', 'Japan']
                  .map((country) => DropdownMenuItem<String>(
                        value: country,
                        child: Text(country),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedDestination = value;
                  if (selectedDestination == 'Vietnam') {
                    distance = 1000;
                    priceByDistance = 22000;
                  } else if (selectedDestination == 'China') {
                    distance = 1500;
                    priceByDistance = 24000;
                  } else if (selectedDestination == 'Philippines') {
                    distance = 2500;
                    priceByDistance = 32000;
                  } else if (selectedDestination == 'South Korea') {
                    distance = 4500;
                    priceByDistance = 42000;
                  } else if (selectedDestination == 'Japan') {
                    distance = 5000;
                    priceByDistance = 45000;
                  }
                  calculateTotalPrice();
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('Distance :', style: TextStyle(fontFamily: 'Noto Sans Thai')),
            Text(distance != null ? ' $distance km' : 'N/A'),
            SizedBox(height: 20),
            Text('Price By Distance:',
                style: TextStyle(fontFamily: 'Noto Sans Thai')),
            Text(priceByDistance != null ? ' \$$priceByDistance' : 'N/A'),
            SizedBox(height: 20),
            Text('Total Price:',
                style: TextStyle(fontFamily: 'Noto Sans Thai')),
            Text(totalPrice != null ? '\$$totalPrice' : 'N/A'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (NameAndSurname == null ||
                    PhoneNumber == null ||
                    Email == null ||
                    selectedContainerType == null ||
                    weight == null ||
                    selectedDestination == null ||
                    distance == null ||
                    basePriceByWeight == null ||
                    priceByDistance == null ||
                    totalPrice == null ||
                    !isValidPhoneNumber(PhoneNumber) ||
                    !isValidEmail(Email)) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Incomplete Information',
                            style: TextStyle(fontFamily: 'Noto Sans Thai')),
                        content: Text(
                            'Please fill in all required fields correctly.',
                            style: TextStyle(fontFamily: 'Noto Sans Thai')),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK',
                                style: TextStyle(fontFamily: 'Noto Sans Thai')),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  Map data = {
                    'NameAndSurname': NameAndSurname,
                    'PhoneNumber': PhoneNumber,
                    'Email': Email,
                    'selectedContainerType': selectedContainerType,
                    'weight': weight,
                    'selectedDestination': selectedDestination,
                    'distance': distance,
                    'basePriceByWeight': basePriceByWeight,
                    'priceByDistance': priceByDistance,
                    'totalPrice': totalPrice,
                  };
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Accept result?',
                            style: TextStyle(fontFamily: 'Noto Sans Thai')),
                        content: Text('Please check your result.',
                            style: TextStyle(fontFamily: 'Noto Sans Thai')),
                        actions: [
                          TextButton(
                            onPressed: () {
                              insert(data);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => output()));
                            },
                            child: Text('Accept',
                                style: TextStyle(fontFamily: 'Noto Sans Thai')),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel',
                                style: TextStyle(fontFamily: 'Noto Sans Thai')),
                          ),
                        ],
                      );
                    },
                  );
                  // insert(data);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => output()));
                  // print('check');
                }
              },
              child: Center(
                  child: Text('Add Order',
                      style: TextStyle(fontFamily: 'Noto Sans Thai'))),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => authPage()));
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
}

bool isValidEmail(String? email) {
  if (email == null || email.isEmpty) return true;
  // Regular expression for a basic email validation
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

bool isValidPhoneNumber(String? phoneNumber) {
  if (phoneNumber == null || phoneNumber.isEmpty) return true;
  // Regular expression for a basic phone number validation
  final phoneRegex = RegExp(r'^0[0-9]{9}$');
  return phoneRegex.hasMatch(phoneNumber);
}

void signUserOut() {
  FirebaseAuth.instance.signOut();
}

void insert(Map input) async {
  userDB data = userDB(
      NameAndSurname: input['NameAndSurname'],
      Email: input['Email'],
      PhoneNumber: input['PhoneNumber'],
      selectedContainerType: input['selectedContainerType'],
      weight: input['weight'],
      selectedDestination: input['selectedDestination'],
      distance: input['distance'],
      basePriceByWeight: input['basePriceByWeight'],
      priceByDistance: input['priceByDistance'],
      totalPrice: input['totalPrice']);
  await manageDB().insertData(data);
}
