import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:key_eductation/Screens/Login/components/background.dart';
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
class LoginDonor extends StatefulWidget {
  @override
  _LoginDonorState createState() => _LoginDonorState();
}

class _LoginDonorState extends State<LoginDonor> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top:size.height * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN DONOR",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  hintText: "Your Email",
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                RoundedPasswordField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () async {
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return VisitPage();
                        }));
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
