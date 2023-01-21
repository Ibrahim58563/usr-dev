import 'package:flutter/material.dart';
import 'package:gpyusr/screens/alphains.dart';
import 'package:gpyusr/screens/soundins.dart';
import 'package:gpyusr/screens/numins.dart';

class chooseCat extends StatefulWidget {
  @override
  State<chooseCat> createState() => _chooseCatState();
}

class _chooseCatState extends State<chooseCat> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/اختيار الفئة.png"), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(30,200,20,0),
              alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            alphains()));
              },
              child: Image.asset(
                'assets/alpha.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(100,0,30,0),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            numins()));
              },
              child: Image.asset(
                'assets/num.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(30,0,20,0),
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            soundins()));
              },
              child: Image.asset(
                'assets/sound.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

