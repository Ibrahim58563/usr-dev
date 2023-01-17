import 'package:flutter/material.dart';
import 'package:yusr/editAccount.dart';
import 'main.dart';

class ViewAccount extends StatefulWidget {
  const ViewAccount({Key? key}) : super(key: key);

  @override
  _ViewAccountState createState() => _ViewAccountState();
}

class _ViewAccountState extends State<ViewAccount> {
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
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.grey,
                size: 45,
              ),
              onPressed: () {
                // do something
                Navigator.push(context, MaterialPageRoute(builder: (context) => editAccount()));
              },
            )
          ],
        ),
        body: Stack(children: [
          Container(
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: FractionalOffset.bottomCenter,
              ),
              ElevatedButton(
                  child: Text('تسجيل الخروج',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                  width: 1,
                                  color:
                                  Color.fromARGB(209, 250, 251, 252)))))),
            ],
          ),
        ]),
      ),
    );
  }
}