import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);
  @override
  _start createState() => _start();
}

class _start extends State<start> {
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 20,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/الصفحة الاولى.png"), fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 550),
                    child:Text(
                      '!مرحبا بك في يُسر',
                      style: TextStyle(
                          color: HexColor('#FFC013'),
                          fontWeight: FontWeight.normal,
                          fontSize: 60,
                          fontFamily: 'Jomhuria',
                        decoration: TextDecoration.none,),
                    ),
                  ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                          child: Text('هيا بنا'),
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(278, 70),
                            backgroundColor: HexColor('#3954A5'),
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontFamily: 'Jomhuria',
                                fontStyle: FontStyle.normal,
                              decoration: TextDecoration.none,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),)

                      ),
                    ),
                    /*Container(
                      //margin: EdgeInsets.all(15),
                      child: ElevatedButton(
                          child: const Text("اختيار فئة "),
                          onPressed: () {
                            Navigator.pushNamed(context, 'chooseCat');
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(20, 30),
                            backgroundColor: Colors.blue,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'jomhuria',
                                fontStyle: FontStyle.normal),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          )),),*/

                  ],
                ),
              );
    //);
  }
}