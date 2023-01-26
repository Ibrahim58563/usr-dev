import 'package:flutter/material.dart';
import 'package:gpyusr1/screens/register.dart';
import 'package:gpyusr1/screens/resetpass.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'chooseprofile.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailContoller = new TextEditingController();
  final TextEditingController passwordContoller = new TextEditingController();
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailContoller,
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
        emailContoller.text = value!;
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
      controller: passwordContoller,
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
        passwordContoller.text = value!;
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

    final loginButton = ElevatedButton(
        child: Text('تسجيل الدخول'),
        onPressed: () {
          //signIn(emailContoller.text, passwordContoller.text);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => chooseProf()));
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(278, 70),
          backgroundColor: HexColor('#3954A5'),
          textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontFamily: 'Jomhuria',
              fontStyle: FontStyle.normal),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ));
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
                              '!أهلًا بك',
                              style: TextStyle(
                                  color: HexColor('#FFC013'),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 100,
                                  fontFamily: 'Jomhuria'),
                            ),
                          ),
                          emailField,
                          SizedBox(
                            height: 30,
                          ),
                          passField,
                          SizedBox(
                            height: 40,
                          ),
                          loginButton,
                          SizedBox(
                            height: 60,
                            width: 100,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => password()));
                                  },
                                  child: const Text(
                                    'نسيت كلمة المرور؟',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 89, 90, 92),
                                        fontSize: 25,
                                        fontFamily: 'Jomhuria',
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyRegister()));
                                },
                                child: Text(
                                  "سجل الان",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: HexColor('#DD7C30'),
                                      fontSize: 30,
                                      fontFamily: 'Jomhuria',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                ' ليس لديك حساب؟',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    //decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontFamily: 'Jomhuria',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
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
  //login function
  /*Future<void> signIn(String email, String password) async{
    if(_formKey.currentState!.validate()){
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "تم تسجيل الدخول بنجاح!"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ViewAccount())),
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message) ;
      }
      );
    }
  }*/

}
