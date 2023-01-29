import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gpyusr1/screens/viewAccount.dart';
import 'package:hexcolor/hexcolor.dart';

import 'chooseCategory.dart';
import 'models/child_model.dart';

class chooseProf extends StatefulWidget {
  @override
  State<chooseProf> createState() => _chooseProf();
}

class _chooseProf extends State<chooseProf> {
  final List<ChildModel> childModels = [];

  Future<dynamic> getChildren() async {
    final user = FirebaseAuth.instance.currentUser;
    final uid = user!.uid;
    final data =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final children = data.data()!['children'];
    if (data.data()!['children'] == null) {
      if (!childModels.contains(' ')) {
        childModels.add(ChildModel(name: ' ', age: ' '));
        setState(() {});
      }
    } else {
      for (var child in children) {
        final childModel = ChildModel(
          name: child['name'],
          age: child['age'],
        );
        childModels.add(childModel);
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    getChildren();
    super.initState();
  }

  QuerySnapshot? querySnapshot;

  @override
  Widget build(BuildContext context) {
    Widget imageProfile() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/user.png"),
              radius: 50,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 140),
            child: ElevatedButton(
                child: Text(
                  name,
                  style: TextStyle(
                    color: HexColor('#D68866'),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => chooseCat()));
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
                      borderRadius: BorderRadius.circular(30.0)),
                )),
          ),
        ],
      );
    }

    final loginButton = ElevatedButton(
        child: Text(name),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => chooseCat()));
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ));
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
                decoration: TextDecoration.none,
              ),
            ),
          ),
          (childModels.first.name == ' ')
              ? Text("There is no Children")
              : ListView.builder(itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(childModels[index].name),
                      Text(childModels[index].age)
                    ],
                  );
                }),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ViewAccount()));
            },
            child: Text(
              'ولي الأمر',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 40,
                fontFamily: 'Jomhuria',
                decoration: TextDecoration.none,
              ),
            ),
          ),
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

  Widget _showChilds() {
    //check if querysnapshot is null
    if (querySnapshot != null) {
      return FutureBuilder(
        future: getChildrenList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.error != null) {
              return Center(
                child: Text('An error occured'),
              );
            } else {
              return Text(
                  "child"); // Or whatever widget you want to return or display
            }
          }
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  //get firestore instance
  getChildrenList() async {
    final user = FirebaseAuth.instance.currentUser;
    final uid = user!.uid;

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('child')
        .doc(uid)
        .get();
  }
}

var numOfChildren =
    2; // here we call how many children are there to dispaly there profiles
var image = null; // store the picture in this variable
String name = 'اسم الطفل'; // store the childs name in this variable

// getData() async {
//   var collection = FirebaseFirestore.instance.collection('users');
//   var querySnapshot = await collection.get();
//   for (var queryDocumentSnapshot in querySnapshot.docs) {
//     Map<String, dynamic> data = queryDocumentSnapshot.data();
//     var name = data['name'];
//     var phone = data['phone'];
//   }
// }
