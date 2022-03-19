import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_home/Widget/anasayfa.dart';
import 'dart:developer';

class HomeScreen extends StatelessWidget {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('odalar').snapshots();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class humudity extends StatefulWidget {
  const humudity({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _humudity createState() => _humudity();
}

class _humudity extends State<humudity> {
  bool isSwitchedS = false;
  final myController_S1_min = TextEditingController();
  final myController_S1_max = TextEditingController();
  final myController_S2_min = TextEditingController();
  final myController_S2_max = TextEditingController();
  final myController_S3_min = TextEditingController();
  final myController_S3_max = TextEditingController();
  final myController_S4_min = TextEditingController();
  final myController_S4_max = TextEditingController();
  final switchState_S4 = true;
  final switchState_S3 = false;
  final switchState_S2 = false;

  final Stream<DocumentSnapshot> salon =
      FirebaseFirestore.instance.collection('ev1').doc('salon').snapshots();
  final Stream<DocumentSnapshot> mutfak =
      FirebaseFirestore.instance.collection('ev1').doc('mutfak').snapshots();
  final Stream<DocumentSnapshot> oda_1 =
      FirebaseFirestore.instance.collection('ev1').doc('oda_1').snapshots();
  final Stream<DocumentSnapshot> oda_2 =
      FirebaseFirestore.instance.collection('ev1').doc('oda_2').snapshots();

  Color bg_color = const Color.fromRGBO(239, 246, 251, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_outlined),
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const anasayfa()),
          );
        },
      ),
      backgroundColor: bg_color,

      body: Center(
        child: Column(
          children: [
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.redAccent)),
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'ODALAR ',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: (Colors.blueGrey),
                    fontSize: 37,
                  ),
                )),
            Container(
              padding: EdgeInsets.only(left: 125, top: 30),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          // For setting the position of icon
                          padding: EdgeInsets.only(right: 15),
                        ),
                        Container(
                          child: Icon(
                            Icons.person_outlined,
                            size: 35,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              margin: const EdgeInsets.all(5.0),
              //color: Colors.white,
              width: 335.0,
              height: 80.0,

              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green)),
                      width: 90.0,
                      height: 30.0,
                      child: Text(
                        'Salon : ',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Nunito-Light',
                          fontWeight: FontWeight.bold,
                          color: (Colors.blueGrey),
                          fontSize: 23,
                        ),
                      )),
                  Container(
                      //padding: EdgeInsets.only(top: 70),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.red)),
                      width: 70.0,
                      height: 25.0,
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: salon,
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong.');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text(
                              'Loading...',
                              textAlign: TextAlign.center,
                            );
                          }

                          final data = snapshot.requireData;

                          return Text(
                            ' ${data['kisi_sayisi']} ',
                            //style: GoogleFonts.nunito(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                          );
                        },
                      )),
                  /////
                  ///
                  TempPopup(
                    minController: myController_S2_min,
                    maxController: myController_S2_max,
                    switchState: switchState_S2,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              margin: const EdgeInsets.all(5.0),
              //color: Colors.white,
              width: 335.0,
              height: 80.0,

              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green)),
                      width: 90.0,
                      height: 30.0,
                      child: Text(
                        'Mutfak : ',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Nunito-Light',
                          fontWeight: FontWeight.bold,
                          color: (Colors.blueGrey),
                          fontSize: 23,
                        ),
                      )),
                  Container(
                      //padding: EdgeInsets.only(top: 70),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.red)),
                      width: 70.0,
                      height: 25.0,
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: mutfak,
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong.');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text(
                              'Loading...',
                              textAlign: TextAlign.center,
                            );
                          }

                          final data = snapshot.requireData;

                          return Text(
                            ' ${data['kisi_sayisi']} ',
                            //style: GoogleFonts.nunito(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                            /*style: const TextStyle(
                              fontFamily: 'Nunito-Regular',
                              fontWeight: FontWeight.bold,
                              color: (Colors.blueGrey),
                              fontSize: 17,
                            ),*/
                          );
                        },
                      )),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              margin: const EdgeInsets.all(5.0),
              //color: Colors.white,
              width: 335.0,
              height: 80.0,

              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green)),
                      width: 90.0,
                      height: 30.0,
                      child: Text(
                        'Oda 1 : ',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Nunito-Light',
                          fontWeight: FontWeight.bold,
                          color: (Colors.blueGrey),
                          fontSize: 23,
                        ),
                      )),
                  Container(
                      //padding: EdgeInsets.only(top: 70),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.red)),
                      width: 70.0,
                      height: 25.0,
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: oda_1,
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong.');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text(
                              'Loading...',
                              textAlign: TextAlign.center,
                            );
                          }

                          final data = snapshot.requireData;

                          return Text(
                            ' ${data['kisi_sayisi']} ',
                            //style: GoogleFonts.nunito(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                            /*style: const TextStyle(
                              fontFamily: 'Nunito-Regular',
                              fontWeight: FontWeight.bold,
                              color: (Colors.blueGrey),
                              fontSize: 17,
                            ),*/
                          );
                        },
                      )),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              margin: const EdgeInsets.all(5.0),
              //color: Colors.white,
              width: 335.0,
              height: 80.0,

              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green)),
                      width: 90.0,
                      height: 30.0,
                      child: Text(
                        'Oda 2 : ',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Nunito-Light',
                          fontWeight: FontWeight.bold,
                          color: (Colors.blueGrey),
                          fontSize: 23,
                        ),
                      )),
                  Container(
                      //padding: EdgeInsets.only(top: 70),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.red)),
                      width: 70.0,
                      height: 25.0,
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: oda_2,
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong.');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text(
                              'Loading...',
                              textAlign: TextAlign.center,
                            );
                          }

                          final data = snapshot.requireData;

                          return Text(
                            ' ${data['kisi_sayisi']} ',
                            //style: GoogleFonts.nunito(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                            /*style: const TextStyle(
                              fontFamily: 'Nunito-Regular',
                              fontWeight: FontWeight.bold,
                              color: (Colors.blueGrey),
                              fontSize: 17,
                            ),*/
                          );
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TempPopup extends StatefulWidget {
  TempPopup({
    Key? key,
    required this.minController,
    required this.maxController,
    required this.switchState,
  }) : super(key: key);

  final TextEditingController minController;
  final TextEditingController maxController;
  bool switchState;

  @override
  _TempPopup createState() => _TempPopup();
}

class _TempPopup extends State<TempPopup> {
  bool isSwitchedS = true;
  bool isSwitchedM = true;
  bool isSwitchedO1 = true;
  bool isSwitchedO2 = true;
  bool sw = false;
  bool isChecked = false;
  @override
  TempPopup get widget => super.widget;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Container(
      width: 40,
      height: 150,
      decoration: BoxDecoration(
          //border: Border.all(color: Colors.blueAccent),
          borderRadius: new BorderRadius.circular(30.0)),
      //padding: EdgeInsets.only(left: 10),
      child: FlatButton(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.settings_outlined,
                color: Colors.red,
                size: 33,
              ),
            ),
          ],
        ),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Sıcaklık Ayarlama'),
            content: Container(
              //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              //width: 150,
              height: 100,
              child: Column(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    //padding: EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          //padding: EdgeInsets.only(top: 20),
                          child: Text("İstenilen oda sıcaklığı:"),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          height: 30,

                          padding: EdgeInsets.only(left: 10),
                          margin: const EdgeInsets.only(left: 20.0),

                          //child: Text("Değer:"),

                          child: SizedBox(
                            width: 60,
                            child: TextField(
                              controller: widget.minController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          //padding: EdgeInsets.only(top: 20),
                          child: Text("Otomatik Sıcaklık Kontrolü: "),
                        ),
                        Container(
                            height: 20,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                            //padding: EdgeInsets.only(top: 20),
                            child: Checkbox(
                              checkColor: Colors.red,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'İptal'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        //child: const Text('Show Dialog'),
      ),
    );
  }
}
