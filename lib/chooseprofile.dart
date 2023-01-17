import 'package:flutter/material.dart';
import 'package:yusr/chooseCategory.dart';
import 'dart:io';
import 'package:hexcolor/hexcolor.dart';
import 'package:yusr/editAccount.dart';


class chooseProf extends StatefulWidget {

  @override
  State<chooseProf> createState() => _chooseProf();
}

class _chooseProf extends State<chooseProf> {
  var numOfChildren = 2;// here we call how many children are there to dispaly there profiles
  var image = null;// store the picture in this variable
  String name= 'اسم الطفل';// store the childs name in this variable

  @override
  Widget build(BuildContext context) {
    final loginButton =
    ElevatedButton(
        child: Text(name),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => chooseCat()));
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(130, 56),
          backgroundColor: HexColor('#DFEFF1'),
          textStyle: TextStyle(
              color: HexColor('#D68866'),
              fontSize: 35,
              fontFamily: 'Jomhuria',
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,

          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)),)

    );
    return Container(
      height: 20,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/اختيار اللاعب.png"), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'من اللاعب؟',
              style: TextStyle(
                  color: HexColor('#0298B7'),
                  fontWeight: FontWeight.normal,
                  fontSize: 60,
                  fontFamily: 'Jomhuria',
                decoration: TextDecoration.none,),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             for (int i=0; i<numOfChildren; i++)
               imageProfile()
            ],
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => editAccount()));
              },
              child: Text(
                'ولي الأمر',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 40,
                  fontFamily: 'Jomhuria',
                  decoration: TextDecoration.none,),
              ),),
          /*Container(
            alignment: Alignment.bottomRight,
            child: Text(
              'ولي الأمر',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 40,
                  fontFamily: 'Jomhuria',
                decoration: TextDecoration.none,),
            ),
          )*/

        ],
      ),
    );
  }
  Widget imageProfile(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 20,bottom: 15),
          child: CircleAvatar(
          backgroundImage: AssetImage("assets/user.png"),
          radius: 50,
          ),),
        Container(
          padding: EdgeInsets.only(bottom: 140),
          child: ElevatedButton(
              child: Text(name,
              style: TextStyle(
                color: HexColor('#D68866'),),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => chooseCat()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(130, 56),
                backgroundColor: HexColor('#DFEFF1'),
                textStyle: TextStyle(
                    color: HexColor('#D68866'),
                    fontSize: 35,
                    fontFamily: 'Jomhuria',
                    fontStyle: FontStyle.normal),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),)

          ) ,
        ),

      ],
    );

  }

}