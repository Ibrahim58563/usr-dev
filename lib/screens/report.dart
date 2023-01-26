import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class viewReport extends StatefulWidget {
  const viewReport({Key? key}) : super(key: key);

  @override
  _viewReportState createState() => _viewReportState();
}

class _viewReportState extends State<viewReport> {
  var name = "اسم الطفل";
  var age = '0';
  var score = '0';
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
          title: Text(
            ' تقرير الطفل',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 192, 19),
                fontWeight: FontWeight.normal,
                fontSize: 55,
                fontFamily: 'Jomhuria'),
          ),
        ),

        body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/user.png"),
                      radius: 50,
                    ),),
                  imageProfile1(),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      'لقد اجتاز طفلك المستويات الاتيه',
                      style: TextStyle(
                          color: HexColor('D68866'),
                          fontWeight: FontWeight.normal,
                          fontSize: 40,
                          fontFamily: 'Jomhuria'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 15, 5, 10),
                    alignment: Alignment.topCenter,
                    height: 120,
                    width: 330,
                    decoration: BoxDecoration(
                      color: HexColor('3954A5'),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(" الأحرف  ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 35,
                          fontFamily: 'Jomhuria'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 5, 5, 10),
                    alignment: Alignment.topCenter,
                    height: 120,
                    width: 330,
                    decoration: BoxDecoration(
                      color: HexColor('FFC013'),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(" الأرقام  ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 35,
                          fontFamily: 'Jomhuria'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 5, 5, 10),
                    alignment: Alignment.topCenter,
                    height: 120,
                    width: 330,
                    decoration: BoxDecoration(
                      color: HexColor('5CB196'),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(" الأصوات  ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 35,
                          fontFamily: 'Jomhuria'),
                    ),
                  ),
                ],
              ),

              Positioned(
                top: 730,
                left:110,
                child: Container(
                  child: ElevatedButton(
                      child: Text('مشاركة'),
                      onPressed: (){
                        //share report function
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(210, 50),
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
        Container(
          padding: EdgeInsets.fromLTRB(25, 15, 5, 10),
          alignment: Alignment.center,
          height: 85,
          width: 140,
          decoration: BoxDecoration(
            color: HexColor('3954A5'),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text("النقاط: "+score,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 35,
                fontFamily: 'Jomhuria'),
          ),
        ),
        Container(
          //padding: EdgeInsets.fromLTRB(25, 15, 5, 10),
          alignment: Alignment.center,
          height: 85,
          width: 140,
          decoration: BoxDecoration(
            color: HexColor('3954A5'),
            borderRadius: BorderRadius.circular(30),

          ),
          child: Text("العمر: "+age,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 35,
                fontFamily: 'Jomhuria'),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(25, 15, 5, 10),
          alignment: Alignment.center,
          height: 85,
          width: 140,
          decoration: BoxDecoration(
            color: HexColor('3954A5'),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text("الاسم: "+name,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 35,
                fontFamily: 'Jomhuria'),
          ),
        ),
        /*Column(
          children: [
            Container(

              child: ElevatedButton(
                  child: Text('تقرير',
                    style: TextStyle(
                      color: HexColor('#D68866'),),),
                  onPressed: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => chooseCat()));
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
        ),*/
      ],
    );
  }
  Widget imageProfile1() {
    return Container(
      padding: EdgeInsets.fromLTRB(70, 15, 5, 10),
      alignment: Alignment.center,
      height: 95,
      width: 450,
      decoration: BoxDecoration(
        color: HexColor('DFEFF1'),
        //borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Text("       النقاط\n "+score,
            style: TextStyle(
                color: HexColor('3954A5'),
                fontWeight: FontWeight.normal,
                fontSize: 35,
                fontFamily: 'Jomhuria'),
          ),
          Text("      العمر \n "+age,
            style: TextStyle(
                color: HexColor('3954A5'),
                fontWeight: FontWeight.normal,
                fontSize: 35,
                fontFamily: 'Jomhuria'),
          ),
          Text("      الاسم \n"+name,
            style: TextStyle(
                color: HexColor('3954A5'),
                fontWeight: FontWeight.normal,
                fontSize: 35,
                fontFamily: 'Jomhuria'),
          ),
        ],
      ),
    );
  }
  Future<void> _signOut() async {
    //await FirebaseAuth.instance.signOut();
  }
}