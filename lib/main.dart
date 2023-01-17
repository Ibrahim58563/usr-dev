import 'package:yusr/chooseCategory.dart';
import 'package:flutter/material.dart';
import 'package:yusr/addChild.dart';
import 'package:yusr/login.dart';
import 'package:yusr/register.dart';
import 'package:yusr/start.dart';
import 'package:yusr/viewAccount.dart';


Future<void> main() async {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: start(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'start': (context) => start(),
      'addChild':(context)=> addChild(),
      'chooseCat':(context)=> chooseCat(),
    },
  ));
}
