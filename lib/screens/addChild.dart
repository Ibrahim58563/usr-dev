import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class addChild extends StatefulWidget {
  @override
  State<addChild> createState() => _addChildState();
}

class _addChildState extends State<addChild> {
  XFile? _imageFile;
  final ImagePicker _Picker = ImagePicker();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController ageController = new TextEditingController();

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

          //bottomOpacity: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(right: 15, top: 20, left: 15, bottom: 20),
                alignment: Alignment.topRight,
                padding: EdgeInsets.fromLTRB(36, 36, 36, 50),
                child: Text(
                  'إضافة طفل',
                  style: TextStyle(
                      color: HexColor('#FFC013'),
                      fontWeight: FontWeight.normal,
                      fontSize: 80,
                      fontFamily: 'Jomhuria'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              imageProfile(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(36, 5, 36, 17),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Jomhuria',
                    color: HexColor('#D68866'),
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0, color: Colors.white),
                    ),
                    hintText: 'ادخل إسم الطفل',
                    filled: true, //<-- SEE HERE
                    fillColor: HexColor('#DFEFF1'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 50),
                child: TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    // for below version 2 use this
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Jomhuria',
                    color: HexColor('#D68866'),
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0, color: Colors.white),
                    ),
                    hintText: 'ادخل عمر الطفل',
                    filled: true, //<-- SEE HERE
                    fillColor: HexColor('#DFEFF1'),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(36),
                child: ElevatedButton(
                    child: Text('إضافة'),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        {
                          "name": nameController.text,
                          "age": ageController.text
                        },
                      );
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
                          borderRadius: BorderRadius.circular(30.0)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          Positioned(
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.grey,
                size: 80.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 130.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            'اختر صورة الحساب',
            style: TextStyle(
              fontFamily: 'Jomhuria',
              fontSize: 40.0,
              color: Colors.grey[500],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                label: Text(
                  'الكاميرا',
                  style: TextStyle(
                    fontFamily: 'Jomhuria',
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                icon: Icon(
                  Icons.camera,
                  size: 40,
                  color: Colors.black,
                ),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
              ),
              TextButton.icon(
                label: Text(
                  'الصور',
                  style: TextStyle(
                    fontFamily: 'Jomhuria',
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                icon: Icon(
                  Icons.image,
                  size: 40,
                  color: Colors.black,
                ),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource media) async {
    var pickedFile = await _Picker.pickImage(
      source: media,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
