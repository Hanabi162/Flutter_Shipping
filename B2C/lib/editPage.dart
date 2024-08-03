import 'package:flutter/material.dart';
import 'manageDB.dart';
import 'model.dart';

class editPage extends StatefulWidget {
  final userDB user;

  editPage({required this.user});

  @override
  State<editPage> createState() => _EditPageState();
}

class _EditPageState extends State<editPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _phoneNumberController =
        TextEditingController(text: widget.user.PhoneNumber);
    _emailController = TextEditingController(text: widget.user.Email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          SizedBox(width: 90),
          Column(
            children: [
              SizedBox(height: 30),
              Text('Edit User', style: TextStyle(fontFamily: 'Noto Sans Thai')),
            ],
          )
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (isValidEmail(_emailController.text) &&
                        isValidPhoneNumber(_phoneNumberController.text)) {
                      // Update user data with new phone number and email
                      widget.user.PhoneNumber = _phoneNumberController.text;
                      widget.user.Email = _emailController.text;

                      // Call method to update data in the database
                      manageDB().updateData(widget.user);

                      // Navigate back to the previous screen
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('Invalid email or phone number format')));
                    }
                  }
                },
                child: Text('Save',
                    style: TextStyle(fontFamily: 'Noto Sans Thai')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String? email) {
    if (email == null || email.isEmpty) return true;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) return true;
    final phoneRegex = RegExp(r'^0[0-9]{9}$');
    return phoneRegex.hasMatch(phoneNumber);
  }
}
