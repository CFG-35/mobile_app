import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:key_eductation/Screens/Signup/signup_screen.dart';
import 'package:key_eductation/Screens/Welcome/welcome_screen.dart';
import 'package:key_eductation/Screens/visit_page.dart';
import 'package:key_eductation/components/already_have_an_account_acheck.dart';
import 'package:key_eductation/components/rounded_button.dart';
import 'package:key_eductation/components/rounded_input_field.dart';
import 'package:key_eductation/components/rounded_password_field.dart';
import 'package:key_eductation/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:key_eductation/crude.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Screens/Login/components/background.dart';
import 'Screens/Login/login_donee.dart';
import 'Screens/Login/login_donor.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  String schoolUserName;
  String ContactNumber;
  String Name;
  String userType;
  String userName;
  String userId,noOfStudents;
  getUserId() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    setState(() {
      userId = uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedInputField(
              hintText: "School Name",
              onChanged: (value) {
                schoolUserName = value;
              },
            ),
            RoundedInputField(
              hintText: 'Number',
              onChanged: (value) {
                ContactNumber = value;
              },
            ),
            RoundedInputField(
              hintText: 'Name',
              onChanged: (value) {
                Name = value;
              },
            ),
            RoundedInputField(
              hintText: 'User Name',
              onChanged: (value) {
                userName = value;
              },
            ),
            RoundedInputField(
              hintText: 'No OF Students',
              onChanged: (value) {
                noOfStudents = value;
              },
            ),
            RoundedButton(
              text: "SUBMIT",
              press: () async{
                await getUserId();
                _firestore.collection("teachers").add({
                  'schoolUserName': schoolUserName,
                  'teacherContactNo': ContactNumber,
                  'teacherName': Name,
                  'teacherUserName': userName,
                  'uid': userId,
                });
                _firestore.collection("schools").add({
                  'contactNo':ContactNumber,
                  'noOfStudents':noOfStudents,
                  'schoolName':schoolUserName,
                  'schoolUserName':schoolUserName,
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
