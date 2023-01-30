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
  List<ChildModel> childModels = [];
  List<dynamic> childs = [];
  List<dynamic> activeChilds = [];
  final user = FirebaseAuth.instance.currentUser;
  // Future<void> getChildren() async {
  //   final uid = user!.uid;
  //   var data =
  //       await FirebaseFirestore.instance.collection("children").doc().get();
  //   List dataList = data.data()?['children'];

  //   for (var element in dataList) {
  //     childModels.add(ChildModel.fromJson(element));
  //     if (childModels[element].parent == 'MkTl34r0UXQhII1pj4FSZwubPu13') {
  //       print(childModels[element].name);
  //       print(childModels[element].age);
  //     }
  //   }

  //   print('productModelList : ${childModels.toList()}');
  // }

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('children');

  Future<void> getChildren() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    final uid = user!.uid;
    // Get data from docs and convert map to List
    final allChildren = querySnapshot.docs.map((doc) => doc.data()).toList();
    childs = allChildren;
    // print(childs.length);
    // print("type is ${childs.toList().runtimeType}");
    // print(childs.keys.toList().elementAt(0).name.cast<String, dynamic>());
    // print(childs[index]['name']);
    childs.forEach((element) {
      if (element['parent'] == uid) {
        print("element name is : ${element['name']}");
        activeChilds.add(element);
      }
    });
    print(activeChilds);
    print(activeChilds.length);
    //   for (var element in allChildren) {
    //   childModels.add(ChildModel.fromJson(element));
    //   if (childModels[element].parent == 'MkTl34r0UXQhII1pj4FSZwubPu13') {
    //     print(childModels[element].name);
    //     print(childModels[element].age);
    //   }
    // }
  }

  @override
  void initState() {
    getChildren();
    super.initState();
  }

  QuerySnapshot? querySnapshot;

  @override
  Widget build(BuildContext context) {
    Widget imageProfile({required String childName}) {
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
                  childName,
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

    setState(() {});
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
    setState(() {});
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
          Expanded(
            child: ListView.builder(
                itemCount: activeChilds.length,
                itemBuilder: (context, index) {
                  // print('name ${childs.toList().elementAt(index).name}');
                  return Column(
                    children: [
                      imageProfile(
                          childName:
                              '${activeChilds[index]['name'].toString()}'),
                    ],
                  );
                }),
          ),
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
    // final uid = user!.uid;

    return await FirebaseFirestore.instance.collection('children').doc().get();
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

