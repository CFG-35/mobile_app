import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:key_eductation/Screens/Login/login_screen.dart';
import 'package:key_eductation/Screens/Signup/signup_screen.dart';
import 'package:key_eductation/Screens/Welcome/components/background.dart';
import 'package:key_eductation/components/rounded_button.dart';
import 'package:key_eductation/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: size.height*0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    //"WELCOME TO U&I",
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  Text(
                    //"WELCOME TO U&I",
                    "A KEY EDUCATION ORGANISATION",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset(
                "assets/icons/helping.svg",
                height: size.height * 0.45,
              ),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                height: 10,
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: "SIGN UP",
                color: kPrimaryLightColor,
                textColor: Colors.black,
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
    );
  }
}
