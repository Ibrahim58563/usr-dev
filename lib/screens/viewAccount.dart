import 'package:flutter/material.dart';
import 'package:gpyusr1/screens/report.dart';
import 'package:hexcolor/hexcolor.dart';

import 'editAccount.dart';
import 'login.dart';

class ViewAccount extends StatefulWidget {
  const ViewAccount({Key? key}) : super(key: key);

  @override
  _ViewAccountState createState() => _ViewAccountState();
}

class _ViewAccountState extends State<ViewAccount> {
  var numOfChildren = 2;// here retrieve number of children
  var name = "اسم الطفل";
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
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(right:36),
              child:  IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.grey,
                  size: 45,
                ),
                onPressed: () {
                  // do something
                  Navigator.push(context, MaterialPageRoute(builder: (context) => editAccount()));
                },
              ),
            )
          ],
          title: Text(
            ' الحساب',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 192, 19),
                fontWeight: FontWeight.normal,
                fontSize: 55,
                fontFamily: 'Jomhuria'),
          ),
        ),

        body: Stack(
            children: [
          /*Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(left: 15, right: 20, top: 5),
            child: Text(
              ' الحساب',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 192, 19),
                  fontWeight: FontWeight.normal,
                  fontSize: 50,
                  fontFamily: 'Jomhuria'),
            ),
          ),*/
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.center ,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (int i=0; i<=numOfChildren; i++)
                imageProfile()
            ],
          ),
          Positioned(
              top: 700,
              left:75,
              child: Container(
                child: ElevatedButton(
                    child: Text('تسجيل الخروج'),
                    onPressed: (){
                      //_signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyLogin()));
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
          ),
        ]),
      ),
    );
  }
  Widget imageProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.redAccent,
            size: 37,
          ),
          onPressed: () {
            // do something
            //Navigator.push(context, MaterialPageRoute(builder: (context) => editAccount()));
          },
        ),
        Column(
          children: [
            Container(
              child: Text(name,
                style: TextStyle(
                    color: HexColor('#FFC013'),
                    fontWeight: FontWeight.normal,
                    fontSize: 40,
                    fontFamily: 'Jomhuria'),
              ),
            ),
            Container(

              child: ElevatedButton(
                  child: Text('تقرير',
                    style: TextStyle(
                      color: HexColor('#D68866'),),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => viewReport()));
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
        ),
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 15),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/user.png"),
            radius: 50,
          ),),

      ],
    );
  }
  Future<void> _signOut() async {
    //await FirebaseAuth.instance.signOut();
  }
}