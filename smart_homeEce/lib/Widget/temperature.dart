import 'dart:core';
//import 'dart:html';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_home/Widget/anasayfa.dart';
import 'dart:developer';
//import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('odalar').snapshots();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class temperature extends StatefulWidget {
  const temperature({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _temperature createState() => _temperature();
}

class _temperature extends State<temperature> {
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

  String docName =
      FirebaseFirestore.instance.collection('odalar').doc().id; // Useles atm.

  final Stream<DocumentSnapshot> salon =
      FirebaseFirestore.instance.collection('ev1').doc('salon').snapshots();
  Color bg_color = const Color.fromRGBO(239, 246, 251, 1.0);
  Color btn_color = const Color.fromRGBO(233, 240, 245, 1.0);
  double numberFontSize = 10;

  @override
  /*void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }
*/
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController_S4_min.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('text field: ${myController_S4_min.text}');
  }

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
                //margin: const EdgeInsets.only(bottom: 20),
                /*decoration:
                    BoxDecoration(border: Border.all(color: Colors.redAccent)),*/
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
              margin: const EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.only(left: 150, top: 30),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(right: 53),
                            child: Icon(
                              Icons.thermostat_outlined,
                              size: 40,
                              color: Colors.red,
                            )),
                        Container(
                          child: Icon(
                            Icons.opacity_outlined,
                            size: 40,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///
            ///     SALON BAŞLIYOR
            ///

            Container(
              padding: EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: const Color(0xfff7ebe9),
                border: Border.all(color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: [
                  Container(
                    /*decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                    ),*/
                    //margin: const EdgeInsets.all(5.0),
                    //color: Colors.white,
                    width: 340.0,
                    height: 60.0,

                    child: Row(
                      children: [
                        Container(
                          /*decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue)),*/
                          width: 100,
                          height: 30,
                          //margin: const EdgeInsets.only(left: 65, right: 50),
                          child: ElevatedButton(
                            child: Stack(children: <Widget>[
                              //elevation: 20.0,
                              Text(
                                "Salon",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: (Colors.blueGrey),
                                  fontSize: 24,
                                ),
                              ),
                            ]),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(btn_color),
                            ),
                            onPressed: () {},
                          ),
                          //onPressed: () {},
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 12, right: 8),
                            //padding: EdgeInsets.only(top: 70),
                            /*decoration: BoxDecoration(
                                border: Border.all(color: Colors.red)),*/
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
                                  '${data['sicaklik']}°C    ',
                                  //style: GoogleFonts.nunito(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                );
                              },
                            )),
                        Container(
                            padding: EdgeInsets.only(left: 19, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                border: Border.all(color: Colors.blueGrey)),
                            width: 5.0,
                            height: 40.0,
                            child: Text(
                              '|',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (Colors.blueGrey),
                                fontSize: 40,
                              ),
                            )),
                        Container(
                            /*decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),*/
                            width: 80.0,
                            height: 25.0,
                            child: StreamBuilder<DocumentSnapshot>(
                              stream: salon,
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text(
                                    'Something went wrong.',
                                    textAlign: TextAlign.center,
                                  );
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
                                  '%${data['nemlilik']}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                );
                              },
                            )),
                        TempPopup(
                          minController: myController_S1_min,
                          maxController: myController_S1_max,
                          switchState: switchState_S2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 335,
                    height: 30,
                    /*decoration:
                        BoxDecoration(border: Border.all(color: Colors.green)),*/
                    //padding: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          margin: const EdgeInsets.only(left: 65, right: 50),
                          child: ElevatedButton(
                            child: Stack(children: <Widget>[
                              Align(
                                  alignment: Alignment.center,
                                  child: PopupMenuButton(
                                      //elevation: 20.0,
                                      child: Text(
                                        " Fan ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (Colors.red),
                                          fontSize: 17,
                                        ),
                                      ),

                                      //key: _menuKey,
                                      itemBuilder: (_) =>
                                          const <PopupMenuItem<String>>[
                                            PopupMenuItem<String>(
                                                child: Text('On'),
                                                value: 'Doge'),
                                            PopupMenuItem<String>(
                                                child: Text('Circulate'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Auto'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Off'),
                                                value: 'Lion'),
                                          ],
                                      onSelected: (_) {}))
                            ]),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(btn_color),
                            ),
                            onPressed: () {},
                          ),
                          //onPressed: () {},
                        ),
                        Container(
                          width: 80,
                          margin: const EdgeInsets.only(right: 50),
                          child: ElevatedButton(
                            child: Stack(children: <Widget>[
                              Align(
                                  alignment: Alignment.center,
                                  child: PopupMenuButton(
                                      //elevation: 20.0,
                                      child: Text(
                                        " Mode ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (Colors.red),
                                          fontSize: 17,
                                        ),
                                      ),

                                      //key: _menuKey,
                                      itemBuilder: (_) =>
                                          const <PopupMenuItem<String>>[
                                            PopupMenuItem<String>(
                                                child: Text('Heat'),
                                                value: 'Doge'),
                                            PopupMenuItem<String>(
                                                child: Text('Cool'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Auto'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Off'),
                                                value: 'Lion'),
                                          ],
                                      onSelected: (_) {}))
                            ]),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(btn_color),
                            ),
                            onPressed: () {},
                          ),
                          //onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///
            ///     SALON BİTİYOR
            ///

            Container(
              padding: EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: const Color(0xfff7ebe9),
                border: Border.all(color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: [
                  Container(
                    /*decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),*/
                    //margin: const EdgeInsets.all(5.0),
                    //color: Colors.white,
                    width: 340.0,
                    height: 60.0,

                    child: Row(
                      children: [
                        Container(
                          width: 110,
                          height: 25,
                          //margin: const EdgeInsets.only(left: 65, right: 50),
                          child: ElevatedButton(
                            child: Stack(children: <Widget>[
                              Align(
                                alignment: Alignment.center,

                                //elevation: 20.0,
                                child: Text(
                                  "Mutfak : ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: (Colors.blueGrey),
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ]),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(btn_color),
                            ),
                            onPressed: () {},
                          ),
                          //onPressed: () {},
                        ),
                        Container(
                            //padding: EdgeInsets.only(top: 70),
                            /*decoration: BoxDecoration(
                                border: Border.all(color: Colors.red)),*/
                            width: 80.0,
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
                                var rng = new Random();
                                return Text(
                                  '${data['sicaklik'] + rng.nextInt(4).toDouble() / 10}°C',
                                  //style: GoogleFonts.nunito(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                );
                              },
                            )),
                        Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                border: Border.all(color: Colors.blueGrey)),
                            width: 5.0,
                            height: 40.0,
                            child: Text(
                              '|',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (Colors.blueGrey),
                                fontSize: 40,
                              ),
                            )),
                        Container(
                            /*decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),*/
                            width: 80.0,
                            height: 25.0,
                            child: StreamBuilder<DocumentSnapshot>(
                              stream: salon,
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text(
                                    'Something went wrong.',
                                    textAlign: TextAlign.center,
                                  );
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text(
                                    'Loading...',
                                    textAlign: TextAlign.center,
                                  );
                                }

                                final data = snapshot.requireData;
                                var rng = new Random();
                                return Text(
                                  '%${data['nemlilik'] + rng.nextInt(6).toDouble() / 10}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                );
                              },
                            )),
                        TempPopup(
                          minController: myController_S4_min,
                          maxController: myController_S4_max,
                          switchState: switchState_S4,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 335,
                    height: 30,
                    /*decoration:
                        BoxDecoration(border: Border.all(color: Colors.green)),*/
                    //padding: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          margin: const EdgeInsets.only(left: 65, right: 50),
                          child: ElevatedButton(
                            child: Stack(children: <Widget>[
                              Align(
                                  alignment: Alignment.center,
                                  child: PopupMenuButton(
                                      //elevation: 20.0,
                                      child: Text(
                                        " Fan ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (Colors.red),
                                          fontSize: 17,
                                        ),
                                      ),

                                      //key: _menuKey,
                                      itemBuilder: (_) =>
                                          const <PopupMenuItem<String>>[
                                            PopupMenuItem<String>(
                                                child: Text('On'),
                                                value: 'Doge'),
                                            PopupMenuItem<String>(
                                                child: Text('Circulate'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Auto'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Off'),
                                                value: 'Lion'),
                                          ],
                                      onSelected: (_) {}))
                            ]),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(btn_color),
                            ),
                            onPressed: () {},
                          ),
                          //onPressed: () {},
                        ),
                        Container(
                          width: 80,
                          margin: const EdgeInsets.only(right: 50),
                          child: ElevatedButton(
                            child: Stack(children: <Widget>[
                              Align(
                                  alignment: Alignment.center,
                                  child: PopupMenuButton(
                                      //elevation: 20.0,
                                      child: Text(
                                        " Mode ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (Colors.red),
                                          fontSize: 17,
                                        ),
                                      ),

                                      //key: _menuKey,
                                      itemBuilder: (_) =>
                                          const <PopupMenuItem<String>>[
                                            PopupMenuItem<String>(
                                                child: Text('Heat'),
                                                value: 'Doge'),
                                            PopupMenuItem<String>(
                                                child: Text('Cool'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Auto'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Off'),
                                                value: 'Lion'),
                                          ],
                                      onSelected: (_) {}))
                            ]),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(btn_color),
                            ),
                            onPressed: () {},
                          ),
                          //onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///
            ///     Mutfak Bitiyor
            ///

            Container(
              padding: EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: const Color(0xfff7ebe9),
                border: Border.all(color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: [
                  Container(
                    /*decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),*/
                    //margin: const EdgeInsets.all(5.0),
                    //color: Colors.white,
                    width: 335.0,
                    height: 60.0,

                    child: Row(
                      children: [
                        Container(
                          width: 95,
                          height: 25,
                          //margin: const EdgeInsets.only(left: 65, right: 50),
                          child: ElevatedButton(
                            child: Stack(children: <Widget>[
                              Align(
                                alignment: Alignment.center,

                                //elevation: 20.0,
                                child: Text(
                                  "Oda 1",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: (Colors.blueGrey),
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ]),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(btn_color),
                            ),
                            onPressed: () {},
                          ),
                          //onPressed: () {},
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 15, right: 8),
                            //padding: EdgeInsets.only(top: 70),
                            /*decoration: BoxDecoration(
                                border: Border.all(color: Colors.red)),*/
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
                                var rng = new Random();
                                return Text(
                                  '${data['sicaklik'] + rng.nextInt(4) / 10 + 1.2}°C',
                                  //style: GoogleFonts.nunito(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                );
                              },
                            )),
                        Container(
                            padding: EdgeInsets.only(left: 19, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                border: Border.all(color: Colors.blueGrey)),
                            width: 5.0,
                            height: 40.0,
                            child: Text(
                              '|',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (Colors.blueGrey),
                                fontSize: 40,
                              ),
                            )),
                        Container(
                            /*decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),*/
                            width: 80.0,
                            height: 25.0,
                            child: StreamBuilder<DocumentSnapshot>(
                              stream: salon,
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text(
                                    'Something went wrong.',
                                    textAlign: TextAlign.center,
                                  );
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text(
                                    'Loading...',
                                    textAlign: TextAlign.center,
                                  );
                                }

                                final data = snapshot.requireData;
                                var rng = new Random();
                                return Text(
                                  '%${data['nemlilik'] + rng.nextInt(6) / 10 + 0.8}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                );
                              },
                            )),
                        TempPopup(
                          minController: myController_S3_min,
                          maxController: myController_S3_max,
                          switchState: switchState_S3,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 335,
                    height: 30,
                    /*decoration:
                        BoxDecoration(border: Border.all(color: Colors.green)),*/
                    //padding: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          margin: const EdgeInsets.only(left: 65, right: 50),
                          child: ElevatedButton(
                            child: Stack(children: <Widget>[
                              Align(
                                  alignment: Alignment.center,
                                  child: PopupMenuButton(
                                      //elevation: 20.0,
                                      child: Text(
                                        " Fan ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (Colors.red),
                                          fontSize: 17,
                                        ),
                                      ),

                                      //key: _menuKey,
                                      itemBuilder: (_) =>
                                          const <PopupMenuItem<String>>[
                                            PopupMenuItem<String>(
                                                child: Text('On'),
                                                value: 'Doge'),
                                            PopupMenuItem<String>(
                                                child: Text('Circulate'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Auto'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Off'),
                                                value: 'Lion'),
                                          ],
                                      onSelected: (_) {}))
                            ]),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(btn_color),
                            ),
                            onPressed: () {},
                          ),
                          //onPressed: () {},
                        ),
                        Container(
                          width: 80,
                          margin: const EdgeInsets.only(right: 50),
                          child: ElevatedButton(
                            child: Stack(children: <Widget>[
                              Align(
                                  alignment: Alignment.center,
                                  child: PopupMenuButton(
                                      //elevation: 20.0,
                                      child: Text(
                                        " Mode ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (Colors.red),
                                          fontSize: 17,
                                        ),
                                      ),

                                      //key: _menuKey,
                                      itemBuilder: (_) =>
                                          const <PopupMenuItem<String>>[
                                            PopupMenuItem<String>(
                                                child: Text('Heat'),
                                                value: 'Doge'),
                                            PopupMenuItem<String>(
                                                child: Text('Cool'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Auto'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Off'),
                                                value: 'Lion'),
                                          ],
                                      onSelected: (_) {}))
                            ]),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(btn_color),
                            ),
                            onPressed: () {},
                          ),
                          //onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///
            ///     Oda 1 Bitiyor
            ///

            Container(
              padding: EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: const Color(0xfff7ebe9),
                border: Border.all(color: Colors.grey.shade700),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: [
                  Container(
                    /*decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),*/
                    //margin: const EdgeInsets.all(5.0),
                    //color: Colors.white,
                    width: 335.0,
                    height: 60.0,

                    child: Row(
                      children: [
                        Container(
                          width: 95,
                          height: 25,
                          //margin: const EdgeInsets.only(left: 65, right: 50),
                          child: ElevatedButton(
                            child: Stack(children: <Widget>[
                              Align(
                                alignment: Alignment.center,

                                //elevation: 20.0,
                                child: Text(
                                  "Oda 2",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: (Colors.blueGrey),
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ]),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(btn_color),
                            ),
                            onPressed: () {},
                          ),
                          //onPressed: () {},
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 5, right: 8),
                            //padding: EdgeInsets.only(top: 70),
                            /*decoration: BoxDecoration(
                                border: Border.all(color: Colors.red)),*/
                            width: 80.0,
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
                                var rng = new Random();
                                return Text(
                                  '${data['sicaklik'] - rng.nextInt(4) / 10 + 0.1}°C',
                                  //style: GoogleFonts.nunito(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                );
                              },
                            )),
                        Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                border: Border.all(color: Colors.blueGrey)),
                            width: 5.0,
                            height: 40.0,
                            child: Text(
                              '|',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (Colors.blueGrey),
                                fontSize: 40,
                              ),
                            )),
                        Container(
                            /*decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),*/
                            width: 80.0,
                            height: 25.0,
                            child: StreamBuilder<DocumentSnapshot>(
                              stream: salon,
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text(
                                    'Something went wrong.',
                                    textAlign: TextAlign.center,
                                  );
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text(
                                    'Loading...',
                                    textAlign: TextAlign.center,
                                  );
                                }

                                final data = snapshot.requireData;
                                var rng = new Random();
                                return Text(
                                  '%${data['nemlilik'] - rng.nextInt(5) / 10 + 1.4}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                );
                              },
                            )),
                        TempPopup(
                          minController: myController_S2_min,
                          maxController: myController_S2_max,
                          switchState: switchState_S2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 335,
                    height: 30,
                    /*decoration:
                        BoxDecoration(border: Border.all(color: Colors.green)),*/
                    //padding: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          margin: const EdgeInsets.only(left: 65, right: 50),
                          child: ElevatedButton(
                            child: Stack(children: <Widget>[
                              Align(
                                  alignment: Alignment.center,
                                  child: PopupMenuButton(
                                      //elevation: 20.0,
                                      child: Text(
                                        " Fan ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (Colors.red),
                                          fontSize: 17,
                                        ),
                                      ),

                                      //key: _menuKey,
                                      itemBuilder: (_) =>
                                          const <PopupMenuItem<String>>[
                                            PopupMenuItem<String>(
                                                child: Text('On'),
                                                value: 'Doge'),
                                            PopupMenuItem<String>(
                                                child: Text('Circulate'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Auto'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Off'),
                                                value: 'Lion'),
                                          ],
                                      onSelected: (_) {}))
                            ]),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(btn_color),
                            ),
                            onPressed: () {},
                          ),
                          //onPressed: () {},
                        ),
                        Container(
                          width: 80,
                          margin: const EdgeInsets.only(right: 50),
                          child: ElevatedButton(
                            child: Stack(children: <Widget>[
                              Align(
                                  alignment: Alignment.center,
                                  child: PopupMenuButton(
                                      //elevation: 20.0,
                                      child: Text(
                                        " Mode ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (Colors.red),
                                          fontSize: 17,
                                        ),
                                      ),

                                      //key: _menuKey,
                                      itemBuilder: (_) =>
                                          const <PopupMenuItem<String>>[
                                            PopupMenuItem<String>(
                                                child: Text('Heat'),
                                                value: 'Doge'),
                                            PopupMenuItem<String>(
                                                child: Text('Cool'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Auto'),
                                                value: 'Lion'),
                                            PopupMenuItem<String>(
                                                child: Text('Off'),
                                                value: 'Lion'),
                                          ],
                                      onSelected: (_) {}))
                            ]),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(btn_color),
                            ),
                            onPressed: () {},
                          ),
                          //onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
