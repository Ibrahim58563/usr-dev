import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gpyusr1/screens/addChild.dart';
import 'package:gpyusr1/screens/chooseCategory.dart';
import 'package:gpyusr1/screens/login.dart';
import 'package:gpyusr1/screens/register.dart';
import 'package:gpyusr1/screens/start.dart';
import 'firebase_options.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "Yusr", options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: start(),
      routes: {
        'register': (context) => MyRegister(),
        'login': (context) => MyLogin(),
        'start': (context) => start(),
        'addChild': (context) => addChild(),
        'chooseCat': (context) => chooseCat(),
      },
    );
  }
}
