import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gpyusr1/screens/login.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'addChild.dart';
import 'chooseprofile.dart';

void main() => runApp(
      MaterialApp(
        home: MyRegister(),
      ),
    );

class MyRegister extends StatefulWidget {
  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  //final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();

  final TextEditingController passwordEditingController =
      new TextEditingController();

  final TextEditingController confirmPasswordEditingController =
      new TextEditingController();
  String? name;
  String? age;
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("الرجاء إدخال البريد الإلكتروني");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("الرجاء إدخال بريد إلكتروني صالح");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: 30,
        fontFamily: 'Jomhuria',
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Color.fromARGB(223, 223, 239, 241),
        filled: true,
        hintText: "البريد الإلكتروني",
        hintStyle: TextStyle(color: HexColor('#D68866'), fontSize: 30),
        enabledBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(width: 0, color: Colors.white),
        ),
      ),
    );
    final passField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
        RegExp regexp = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("الرجاء إدخال كلمة المرور");
        }
        if (!regexp.hasMatch(value)) {
          return ("الرجاء إدخال كلمة مرور صالحة (٦ أحرف على الأقل)");
        }
        return null;
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: 30,
        fontFamily: 'Jomhuria',
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Color.fromARGB(223, 223, 239, 241),
        filled: true,
        hintText: "كلمة المرور",
        hintStyle: TextStyle(color: HexColor('#D68866'), fontSize: 30),
        enabledBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(width: 0, color: Colors.white),
        ),
      ),
    );

    final repassField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordEditingController.text) {
          return "كلمة المرور لا تطابق";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: 30,
        fontFamily: 'Jomhuria',
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Color.fromARGB(223, 223, 239, 241),
        filled: true,
        hintText: "إعادة كلمة المرور",
        hintStyle: TextStyle(color: HexColor('#D68866'), fontSize: 30),
        enabledBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(width: 0, color: Colors.white),
        ),
      ),
    );

    final signinButton = Padding(
      padding: EdgeInsets.only(bottom: 0.0),
      child: ElevatedButton(
          child: Text('تسجيل'),
          onPressed: () async {
            signUp(
                emailController.text, passwordEditingController.text, context);
            // print();
            // final dynamic _response = await
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => addChild()));
            // name = _response["name"];
            // age = _response["age"];
            // print(name);
            // print(age);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(278, 70),
            backgroundColor: HexColor('#3954A5'),
            textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'Jomhuria',
                fontStyle: FontStyle.normal),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          )),
    );
    return Container(
      width: 150,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          foregroundColor: Colors.grey,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                right: 15, top: 20, left: 15, bottom: 22),
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.fromLTRB(20, 5, 10, 70),
                            child: Text(
                              'إنشاء حساب',
                              style: TextStyle(
                                  color: HexColor('#FFC013'),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 90,
                                  fontFamily: 'Jomhuria'),
                            ),
                          ),
                          emailField,
                          SizedBox(
                            height: 30,
                          ),
                          passField,
                          SizedBox(
                            height: 30,
                          ),
                          repassField,
                          SizedBox(
                            height: 40,
                          ),
                          // TextButton.icon(
                          //   label: Text(
                          //     'إضافة طفل',
                          //     style: TextStyle(
                          //       fontFamily: 'Jomhuria',
                          //       fontSize: 30,
                          //       color: Colors.black,
                          //     ),
                          //   ),
                          //   icon: Icon(
                          //     Icons.add,
                          //     size: 40,
                          //     color: Colors.black,
                          //   ),
                          //   onPressed: () async {
                          //     // final dynamic _response = await Navigator.push(
                          //     //     context,
                          //     //     MaterialPageRoute(
                          //     //         builder: (context) => addChild()));
                          //     // name = _response["name"];
                          //     // age = _response["age"];
                          //     // print(name);
                          //     // print(age);
                          //   },
                          // ),
                          SizedBox(
                            height: 60,
                          ),
                          signinButton,
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp(String email, String password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        return value;
      });
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userName = user.displayName;
        final email = user.email;
        final photoUrl = user.photoURL;

        // Check if user's email is verified
        final emailVerified = user.emailVerified;

        // The user's ID, unique to the Firebase project. Do NOT use this value to
        // authenticate with your backend server, if you have one. Use
        // User.getIdToken() instead.
        final uid = user.uid;
        addChild.userId = uid;
        debugPrint(uid);
        var collection = FirebaseFirestore.instance.collection('users');
        collection.doc() // <-- Document ID
            .set({
          'parent': user.uid,
          'name': user.email!,
          // 'age': age,
          // 'photoUrl': 'assets/alpha.png',
        }) // <-- Your data
            .then((_) {
          print('Added');
        }).catchError((error) => print('Add failed: $error'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
