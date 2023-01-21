import 'package:gpyusr/screens/chooseCategory.dart';
import 'package:flutter/material.dart';
import 'package:gpyusr/screens/addChild.dart';
import 'package:gpyusr/screens/login.dart';
import 'package:gpyusr/screens/register.dart';
import 'package:gpyusr/screens/start.dart';
import 'package:gpyusr/screens/viewAccount.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(name: "Yusr", options: DefaultFirebaseOptions.currentPlatform);

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
