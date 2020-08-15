import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:key_eductation/Screens/Welcome/welcome_screen.dart';
import 'package:key_eductation/coarses.dart';
import 'package:key_eductation/components/rounded_button.dart';
import 'package:key_eductation/components/rounded_input_field.dart';
import 'package:key_eductation/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:key_eductation/crude.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Login/components/background.dart';

class VisitPage extends StatefulWidget {
  @override
  _VisitPageState createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage> {
  String query;
  var auth = Firestore.instance;
  alert({BuildContext context,String title,String desc}) {
    return Alert(
        context: context,
        title: "$title",
        desc: "$desc")
        .show();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryLightColor,
          elevation: 1,
          leading: GestureDetector(
            onTap: (){
              var authTemp = FirebaseAuth.instance;
              authTemp.signOut();
            },
            child: Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Background(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top:20),
                  child: ButtonVisitPage(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Coarses(
                              url:
                              'https://sites.google.com/keyeducationfoundation.org/self-training-modules/courses/introduction-to-ece?authuser=0'),
                        ),
                      );
                    },
                    text: 'COARSES',
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ButtonVisitPage(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>Coarses(url: 'https://sites.google.com/keyeducationfoundation.org/self-training-modules/test',)));
                    },
                    text: 'TAKE TEST',
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    minLines: 10,
                    maxLines: 15,
                    onChanged: (value) {
                      setState(() {
                        query = value;
                      });
                    },
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Write your Query',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                ButtonVisitPage(
                  text: 'SEND',
                  onTap: ()async{
                    CrudeMethods objcrude = CrudeMethods();
                    String uid=await  objcrude.getUserId();
                    bool b = false;
                    try{
                      auth.collection('queries').add(
                        {
                          'answer':"",
                          'query':query,
                          'uid':uid,
                        }
                      );
                    }catch(e)
                    {
                      b=true;
                      print(e);
                    }
                    if(b){
                      alert(context: context,desc: 'Query not uploaded',title: 'unsuccessful');
                    }
                    else
                      {
                        alert(context: context,desc: 'Query uploaded',title: 'successful');
                        setState(() {
                          query=null;
                        });
                      }
                  },
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ButtonVisitPage extends StatelessWidget {
  final Function onTap;
  final String text;
  const ButtonVisitPage({Key key, this.onTap, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 60,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(29),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text.toString(),
            style: TextStyle(
                color: Colors.white54,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
