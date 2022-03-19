import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_home/Widget/anasayfa.dart';
import 'dart:developer';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('odalar').snapshots();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class light extends StatefulWidget {
  const light({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _light createState() => _light();
}

class _light extends State<light> {
  bool isSwitchedS = true;
  bool isSwitchedM = true;
  bool isSwitchedO1 = true;
  bool isSwitchedO2 = true;

  bool isDeneme = true;

  final Stream<DocumentSnapshot> users =
      FirebaseFirestore.instance.collection('ev1').doc('salon').snapshots();
  final Stream<DocumentSnapshot> mutfak =
      FirebaseFirestore.instance.collection('ev1').doc('mutfak').snapshots();
  final Stream<DocumentSnapshot> oda_1 =
      FirebaseFirestore.instance.collection('ev1').doc('oda_1').snapshots();
  final Stream<DocumentSnapshot> oda_2 =
      FirebaseFirestore.instance.collection('ev1').doc('oda_2').snapshots();

  var collection = FirebaseFirestore.instance.collection('ev1');
  var collectionM = FirebaseFirestore.instance.collection('ev1');
  var collectionO1 = FirebaseFirestore.instance.collection('ev1');
  var collectionO2 = FirebaseFirestore.instance.collection('ev1');

  Color bg_color = const Color.fromRGBO(239, 246, 251, 1.0);
  @override
  Widget build(BuildContext context) {
    var data;
    var dataM;
    var dataO1;
    var dataO2;
    //isDeneme = !isDeneme;

    /*if (data['aydinlatma'] == 0) {
      isSwitchedS = true;
    } else {
      isSwitchedS = false;
    }*/

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
      /*appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("light"),
      ),*/
      body: Center(
        child: Column(
          children: [
            Container(
                // decoration:
                //     BoxDecoration(border: Border.all(color: Colors.redAccent)),
                padding: EdgeInsets.only(top: 50),
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
              width: 180,
              height: 2,
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey.shade600)),
            ),
            Container(
              padding: EdgeInsets.only(left: 125, bottom: 10),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          // For setting the position of icon
                          padding: EdgeInsets.only(right: 60),
                        ),
                        Container(
                          child: Icon(
                            Icons.tungsten_outlined,
                            size: 45,
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
              //padding: EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff7ebe9),
                      border: Border.all(color: Colors.grey.shade700),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.only(left: 10),
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.blueAccent),
                    // ),
                    margin: const EdgeInsets.all(10.0),
                    //color: Colors.white,
                    width: 300.0,
                    height: 80.0,

                    child: Row(
                      children: [
                        Container(
                            //padding: EdgeInsets.only(left: 10),

                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.blueAccent)),
                            width: 90.0,
                            height: 30.0,
                            child: Text(
                              'Salon : ',
                              //textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              //style: GoogleFonts.nunito(),

                              style: const TextStyle(
                                fontSize: 23,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Switch(
                                  value: isSwitchedS,
                                  onChanged: (isDeneme) {
                                    //print(isSwitched);
                                    setState(() {
                                      if (data['aydinlatma'] == 0) {
                                        collection
                                            .doc(
                                                'salon') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 1});
                                        print("ON");
                                        isSwitchedS = true;
                                      } else {
                                        collection
                                            .doc(
                                                'salon') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 0});
                                        print("OFF");
                                        isSwitchedS = false;
                                      }
                                      //print(isSwitched);
                                    });

                                    //await users.collection("notes").doc("doc-id").update(noteToUpdate.toMap());
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: 50.0,
                          height: 15.0,
                          child: Container(
                            width: 80.0,
                            height: 100.0,
                            child: StreamBuilder<DocumentSnapshot>(
                              stream: users,
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Something went wrong.');
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text('Loading...');
                                }

                                data = snapshot.requireData;
                                if (data['aydinlatma'] == 0 &&
                                    isSwitchedS == false) {
                                  return const Text(
                                      "OFF"); //'The room\'s lights are on!'
                                } else if (data['aydinlatma'] == 1 &&
                                    isSwitchedS == true) {
                                  return const Text(
                                      "ON"); //'The room\'s lights are off!'
                                } else {
                                  return const Text("");
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 40,
                          child: FlatButton(
                              onPressed: () => null, //pop up
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.settings_outlined,
                                      color: Colors.red,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //padding: EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff7ebe9),
                      border: Border.all(color: Colors.grey.shade700),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.only(left: 10),
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.blueAccent),
                    // ),
                    margin: const EdgeInsets.all(10.0),
                    //color: Colors.white,
                    width: 300.0,
                    height: 80.0,

                    child: Row(
                      children: [
                        Container(
                            //padding: EdgeInsets.only(left: 10),
                            //decoration: BoxDecoration(
                            //  border: Border.all(color: Colors.blueAccent)),
                            width: 90.0,
                            height: 30.0,
                            child: Text(
                              'Mutfak : ',
                              //textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              //style: GoogleFonts.nunito(),

                              style: const TextStyle(
                                fontSize: 23,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Switch(
                                  value: isSwitchedM,
                                  //child: Text("sa"),

                                  onChanged: (value) {
                                    //print(isSwitched);
                                    setState(() {
                                      if (dataM['aydinlatma'] == 0) {
                                        collectionM
                                            .doc(
                                                'mutfak') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 1});
                                        print("ON");
                                        isSwitchedM = true;
                                      } else {
                                        collectionM
                                            .doc(
                                                'mutfak') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 0});
                                        print("OFF");
                                        isSwitchedM = false;
                                      }
                                      //print(isSwitched);
                                    });

                                    //await users.collection("notes").doc("doc-id").update(noteToUpdate.toMap());
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: 50.0,
                          height: 15.0,
                          child: Container(
                            width: 80.0,
                            height: 100.0,
                            child: StreamBuilder<DocumentSnapshot>(
                              stream: mutfak,
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Something went wrong.');
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text('Loading...');
                                }

                                dataM = snapshot.requireData;
                                if (dataM['aydinlatma'] == 0 &&
                                    isSwitchedM == false) {
                                  return const Text(
                                      "OFF"); //'The room\'s lights are on!'
                                } else if (dataM['aydinlatma'] == 1 &&
                                    isSwitchedM == true) {
                                  return const Text(
                                      "ON"); //'The room\'s lights are off!'
                                } else {
                                  return const Text("");
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 40,
                          child: FlatButton(
                              onPressed: () => null, //pop up
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.settings_outlined,
                                      color: Colors.red,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //padding: EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff7ebe9),
                      border: Border.all(color: Colors.grey.shade700),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    //padding: EdgeInsets.only(left: 20),
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.blueAccent),
                    // ),
                    margin: const EdgeInsets.all(10.0),
                    //color: Colors.white,
                    width: 300.0,
                    height: 80.0,

                    child: Row(
                      children: [
                        Container(
                            //padding: EdgeInsets.only(left: 10),
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.blueAccent)),
                            width: 90.0,
                            height: 30.0,
                            child: Text(
                              'Oda 1: ',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              //style: GoogleFonts.nunito(),

                              style: const TextStyle(
                                fontSize: 23,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 22),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Switch(
                                  value: isSwitchedO1,
                                  //child: Text("sa"),

                                  onChanged: (value) {
                                    //print(isSwitched);
                                    setState(() {
                                      if (dataO1['aydinlatma'] == 0) {
                                        collectionO1
                                            .doc(
                                                'oda_1') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 1});
                                        print("ON");
                                        isSwitchedO1 = true;
                                      } else {
                                        collectionO1
                                            .doc(
                                                'oda_1') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 0});
                                        print("OFF");
                                        isSwitchedO1 = false;
                                      }
                                      //print(isSwitched);
                                    });

                                    //await users.collection("notes").doc("doc-id").update(noteToUpdate.toMap());
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: 50.0,
                          height: 15.0,
                          child: Container(
                            width: 80.0,
                            height: 100.0,
                            child: StreamBuilder<DocumentSnapshot>(
                              stream: oda_1,
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Something went wrong.');
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text('Loading...');
                                }

                                dataO1 = snapshot.requireData;
                                if (dataO1['aydinlatma'] == 0 &&
                                    isSwitchedO1 == false) {
                                  return const Text(
                                      "OFF"); //'The room\'s lights are on!'
                                } else if (dataO1['aydinlatma'] == 1 &&
                                    isSwitchedO1 == true) {
                                  return const Text(
                                      "ON"); //'The room\'s lights are off!'
                                } else {
                                  return const Text("");
                                }
                                //return const Text("");
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 40,
                          child: FlatButton(
                              onPressed: () => null, //pop up
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.settings_outlined,
                                      color: Colors.red,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //padding: EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff7ebe9),
                      border: Border.all(color: Colors.grey.shade700),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    //padding: EdgeInsets.only(left: 20),
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.blueAccent),
                    // ),
                    margin: const EdgeInsets.all(10.0),
                    //color: Colors.white,
                    width: 300.0,
                    height: 80.0,

                    child: Row(
                      children: [
                        Container(
                            //padding: EdgeInsets.only(left: 2),
                            //decoration: BoxDecoration(
                            //  border: Border.all(color: Colors.blueAccent)),
                            width: 90.0,
                            height: 30.0,
                            child: Text(
                              'Oda 2: ',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              //style: GoogleFonts.nunito(),

                              style: const TextStyle(
                                fontSize: 23,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 22),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Switch(
                                  value: isSwitchedO2,
                                  //child: Text("sa"),

                                  onChanged: (value) {
                                    //print(isSwitched);
                                    setState(() {
                                      if (dataO2['aydinlatma'] == 0) {
                                        collectionO2
                                            .doc(
                                                'oda_2') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 1});
                                        print("ON");
                                        isSwitchedO2 = true;
                                      } else {
                                        collectionO2
                                            .doc(
                                                'oda_2') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 0});
                                        print("OFF");
                                        isSwitchedO2 = false;
                                      }
                                      //print(isSwitched);
                                    });

                                    //await users.collection("notes").doc("doc-id").update(noteToUpdate.toMap());
                                  },
                                  activeTrackColor: Colors.lightGreenAccent,
                                  activeColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: 50.0,
                          height: 15.0,
                          child: Container(
                            width: 80.0,
                            height: 100.0,
                            child: StreamBuilder<DocumentSnapshot>(
                              stream: oda_2,
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Something went wrong.');
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text('Loading...');
                                }

                                dataO2 = snapshot.requireData;
                                if (dataO2['aydinlatma'] == 0 &&
                                    isSwitchedO2 == false) {
                                  return const Text(
                                      "OFF"); //'The room\'s lights are on!'
                                } else if (dataO2['aydinlatma'] == 1 &&
                                    isSwitchedO2 == true) {
                                  return const Text(
                                      "ON"); //'The room\'s lights are off!'
                                } else {
                                  return const Text("");
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 40,
                          child: FlatButton(
                              onPressed: () => null, //pop up
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.settings_outlined,
                                      color: Colors.red,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0))),
                        ),
                      ],
                    ),
                  ),
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
