import 'package:flutter/material.dart';

class CheckAnswer extends StatelessWidget {
  final bool check;
  String pic = 'Assets/wrongAnswer.png';
  String theText = 'أعد المحاولة';
  CheckAnswer(this.check);

  //final check = true;

  void rightAnswer() {
    if (check == true) {
      pic = 'Assets/rightAnswer.png';
      theText = 'التالي';
    } else {
      pic = 'Assets/wrongAnswer.png';
      theText = 'أعد المحاولة';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple),
          ),
          child: Text(
            'Check Answer',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            rightAnswer();
            showTheDialog(context);
          },
        ),
        // rightAnswer(),
        // showTheDialog(context),
      ],
    ));
  }

  void showTheDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      content: Image(
        image: AssetImage(pic),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      contentPadding: const EdgeInsets.all(40),
      // buttonPadding: EdgeInsets.only(
      //   bottom: 70,
      //   left: 120,
      // ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            theText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Jomhuria',
              fontSize: 30,
            ),
          ),
          style: ElevatedButton.styleFrom(
            //backgroundColor:MaterialStateProperty.all(Colors.black),
            primary: Color.fromARGB(255, 51, 59, 153),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 90,
              vertical: 20,
            ),
          ),
        )
      ],
      actionsAlignment: MainAxisAlignment.center,
    );

    showDialog(context: context, builder: (context) => alertDialog);
  }
}
