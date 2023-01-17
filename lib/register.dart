import 'package:yusr/addChild.dart';
import 'package:flutter/material.dart';
import 'package:yusr/login.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'package:hexcolor/hexcolor.dart';


void main() => runApp(MaterialApp(
  home: MyRegister(),
),);


class MyRegister extends StatelessWidget {
  final _formKey= GlobalKey<FormState>();
  final TextEditingController emailContoller = new TextEditingController();
  final TextEditingController passwordContoller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailContoller,
      keyboardType: TextInputType.emailAddress,
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
        hintStyle: TextStyle(
            color: HexColor('#D68866'),
            fontSize: 30),
        enabledBorder: OutlineInputBorder( //<-- SEE HERE
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(width: 0, color: Colors.white),
        ),
      ),
    );
    final passField = TextFormField(
      autofocus: false,
      controller: passwordContoller,
      obscureText: true,
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
        hintStyle: TextStyle(
            color: HexColor('#D68866'),
            fontSize: 30),
        enabledBorder: OutlineInputBorder( //<-- SEE HERE
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(width: 0, color: Colors.white),
        ),
      ),
    );

    final repassField = TextFormField(
      autofocus: false,
      controller: passwordContoller,
      obscureText: true,
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
        hintText: "إعادة كلمة المرور",
        hintStyle: TextStyle(
            color: HexColor('#D68866'),
            fontSize: 30),
        enabledBorder: OutlineInputBorder( //<-- SEE HERE
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(width: 0, color: Colors.white),
        ),
      ),
    );

    final signinButton = Padding(
      padding: EdgeInsets.only(bottom: 0.0),
      child: ElevatedButton(
          child: Text('تسجيل'),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: Size(278, 70),
            backgroundColor: HexColor('#3954A5'),
            textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'Jomhuria',
                fontStyle: FontStyle.normal),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),)

      ),



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
                          )
                          , emailField,
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
                          TextButton.icon(
                            label: Text('إضافة طفل',
                              style: TextStyle(
                                fontFamily: 'Jomhuria',
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                            icon: Icon(
                              Icons.add,
                              size: 40,
                              color: Colors.black,
                            ),
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          addChild()));
                            },
                          ),
                          SizedBox(
                            height: 60,
                          ),

                          signinButton,

                        ]
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}