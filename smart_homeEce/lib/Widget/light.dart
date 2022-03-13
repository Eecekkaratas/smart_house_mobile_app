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
  bool isSwitched = true;
  final Stream<DocumentSnapshot> users =
      FirebaseFirestore.instance.collection('ev1').doc('salon').snapshots();

  var collection = FirebaseFirestore.instance.collection('ev1');
  Color bg_color = const Color.fromRGBO(239, 246, 251, 1.0);
  @override
  Widget build(BuildContext context) {
    var data;
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
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.redAccent)),
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  'Odalar ',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.nunitoSans(),
                )),
            Container(
              //padding: EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    margin: const EdgeInsets.all(10.0),
                    //color: Colors.white,
                    width: 345.0,
                    height: 80.0,

                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            width: 90.0,
                            height: 30.0,
                            child: Text(
                              'Salon : ',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              //style: GoogleFonts.nunito(),

                              style: const TextStyle(
                                fontSize: 23,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Switch(
                                  value: isSwitched,
                                  //child: Text("sa"),

                                  onChanged: (value) {
                                    //print(isSwitched);
                                    setState(() {
                                      if (data['aydinlatma'] == 0) {
                                        collection
                                            .doc(
                                                'salon') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 1});
                                        print("ON");
                                        isSwitched = true;
                                      } else {
                                        collection
                                            .doc(
                                                'salon') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 0});
                                        print("OFF");
                                        isSwitched = false;
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
                                    isSwitched == false) {
                                  return const Text(
                                      "OFF"); //'The room\'s lights are on!'
                                } else if (data['aydinlatma'] == 1 &&
                                    isSwitched == true) {
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
                          width: 80,
                          height: 40,
                          //padding: EdgeInsets.only(left: 10),
                          /*
                          child: PopupMenuButton(
                            child: Center(child: Text('click here')),
                            itemBuilder: (context) {
                              return List.generate(5, (index) {
                                return PopupMenuItem(
                                  child: Text('button no $index'),
                                );
                              });
                            },
                          ),

                          */
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
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    margin: const EdgeInsets.all(10.0),
                    //color: Colors.white,
                    width: 345.0,
                    height: 80.0,

                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            width: 90.0,
                            height: 30.0,
                            child: Text(
                              'Salon : ',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              //style: GoogleFonts.nunito(),

                              style: const TextStyle(
                                fontSize: 23,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Switch(
                                  value: isSwitched,
                                  //child: Text("sa"),

                                  onChanged: (value) {
                                    //print(isSwitched);
                                    setState(() {
                                      if (data['aydinlatma'] == 0) {
                                        collection
                                            .doc(
                                                'salon') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 1});
                                        print("ON");
                                        isSwitched = true;
                                      } else {
                                        collection
                                            .doc(
                                                'salon') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 0});
                                        print("OFF");
                                        isSwitched = false;
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
                                    isSwitched == false) {
                                  return const Text(
                                      "OFF"); //'The room\'s lights are on!'
                                } else if (data['aydinlatma'] == 1 &&
                                    isSwitched == true) {
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
                          width: 80,
                          height: 40,
                          //padding: EdgeInsets.only(left: 10),
                          /*
                          child: PopupMenuButton(
                            child: Center(child: Text('click here')),
                            itemBuilder: (context) {
                              return List.generate(5, (index) {
                                return PopupMenuItem(
                                  child: Text('button no $index'),
                                );
                              });
                            },
                          ),

                          */
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
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    margin: const EdgeInsets.all(10.0),
                    //color: Colors.white,
                    width: 345.0,
                    height: 80.0,

                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            width: 90.0,
                            height: 30.0,
                            child: Text(
                              'Salon : ',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              //style: GoogleFonts.nunito(),

                              style: const TextStyle(
                                fontSize: 23,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Switch(
                                  value: isSwitched,
                                  //child: Text("sa"),

                                  onChanged: (value) {
                                    //print(isSwitched);
                                    setState(() {
                                      if (data['aydinlatma'] == 0) {
                                        collection
                                            .doc(
                                                'salon') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 1});
                                        print("ON");
                                        isSwitched = true;
                                      } else {
                                        collection
                                            .doc(
                                                'salon') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 0});
                                        print("OFF");
                                        isSwitched = false;
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
                                    isSwitched == false) {
                                  return const Text(
                                      "OFF"); //'The room\'s lights are on!'
                                } else if (data['aydinlatma'] == 1 &&
                                    isSwitched == true) {
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
                          width: 80,
                          height: 40,
                          //padding: EdgeInsets.only(left: 10),
                          /*
                          child: PopupMenuButton(
                            child: Center(child: Text('click here')),
                            itemBuilder: (context) {
                              return List.generate(5, (index) {
                                return PopupMenuItem(
                                  child: Text('button no $index'),
                                );
                              });
                            },
                          ),

                          */
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
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    margin: const EdgeInsets.all(10.0),
                    //color: Colors.white,
                    width: 345.0,
                    height: 80.0,

                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            width: 90.0,
                            height: 30.0,
                            child: Text(
                              'Salon : ',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              //style: GoogleFonts.nunito(),

                              style: const TextStyle(
                                fontSize: 23,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: Switch(
                                  value: isSwitched,
                                  //child: Text("sa"),

                                  onChanged: (value) {
                                    //print(isSwitched);
                                    setState(() {
                                      if (data['aydinlatma'] == 0) {
                                        collection
                                            .doc(
                                                'salon') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 1});
                                        print("ON");
                                        isSwitched = true;
                                      } else {
                                        collection
                                            .doc(
                                                'salon') // <-- Doc ID where data should be updated.
                                            .update({'aydinlatma': 0});
                                        print("OFF");
                                        isSwitched = false;
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
                                    isSwitched == false) {
                                  return const Text(
                                      "OFF"); //'The room\'s lights are on!'
                                } else if (data['aydinlatma'] == 1 &&
                                    isSwitched == true) {
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
                          width: 80,
                          height: 40,
                          //padding: EdgeInsets.only(left: 10),
                          /*
                          child: PopupMenuButton(
                            child: Center(child: Text('click here')),
                            itemBuilder: (context) {
                              return List.generate(5, (index) {
                                return PopupMenuItem(
                                  child: Text('button no $index'),
                                );
                              });
                            },
                          ),

                          */
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
