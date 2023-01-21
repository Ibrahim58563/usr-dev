import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:gpyusr/main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';

class password extends StatelessWidget {
  final TextEditingController emailContoller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            Container(
              margin: EdgeInsets.only(
                  right: 15, top: 20, left: 15, bottom: 22),
              alignment: Alignment.topRight,
              padding: EdgeInsets.fromLTRB(20,5,10,70),
              child: Text(
                'تغيير كلمة المرور',
                style: TextStyle(
                    color: HexColor('#FFC013'),
                    fontWeight: FontWeight.normal,
                    fontSize: 70,
                    fontFamily: 'Jomhuria'),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: 15, top: 0, left: 15, bottom: 0),
                      child: Column(
                        children: [
                        TextFormField(
                        autofocus: false,
                        controller: emailContoller,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value){
                          if(value!.isEmpty){
                            return ("الرجاء إدخال البريد الإلكتروني");
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                            return ("الرجاء إدخال بريد إلكتروني صالح");
                          }
                          return null;
                        },
                        onSaved: (value){
                          emailContoller.text= value!;
                        },
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Jomhuria',
                        ),
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(223, 223, 239, 241),
                          filled: true,
                          hintText: "البريد الإلكتروني",
                          hintStyle: TextStyle(
                              color: HexColor('#D68866'),
                              fontSize: 30),
                          enabledBorder: OutlineInputBorder(//<-- SEE HERE
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 0, color: Colors.white),
                          ),
                        ),
                      ),
                          /*TextField(
                            style: TextStyle(
                                color: Color.fromARGB(214, 214, 136, 102)),
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                fillColor: Color.fromARGB(223, 223, 239, 241),
                                filled: true,
                                hintText: "البريد الإلكتروني",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(214, 214, 136, 102),
                                    fontSize: 15),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color:
                                      Color.fromARGB(223, 223, 239, 241)),
                                  borderRadius: BorderRadius.circular(30),
                                )),
                          ),*/
                          SizedBox(
                            height: 20,
                            width: 100,
                          ),
                          Container(
                            padding: EdgeInsets.all(36),
                            child: ElevatedButton(
                                child: Text('إرسال'),
                                onPressed: () {
                                  Navigator.of(context).pop();
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
                                      borderRadius: BorderRadius.circular(30.0)),)

                            ),
                          ),
                          SizedBox(
                            height: 0,
                            width: 50,
                          ),

                          SizedBox(
                            height: 50,
                            width: 100,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future resetPass(context) async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context)=> Center(child: CircularProgressIndicator()));
    try{
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailContoller.text.trim());
      Fluttertoast.showToast(msg: 'تم إرسال رابط إدخال كلمة المرور الجديدة على بريدك الالكتروني ') ;
      Navigator.of(context).popUntil((route) => route.isActive);
    } on FirebaseAuthException catch(e){
      Fluttertoast.showToast(msg: 'لقد حدث خطأ') ;
      Navigator.of(context).pop();
    }
  }
}