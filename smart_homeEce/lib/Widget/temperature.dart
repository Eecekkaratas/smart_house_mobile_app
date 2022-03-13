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

class temperature extends StatefulWidget {
  const temperature({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _temperature createState() => _temperature();
}

class _temperature extends State<temperature> {
  String docName =
      FirebaseFirestore.instance.collection('odalar').doc().id; // Useles atm.

  final Stream<DocumentSnapshot> salon =
      FirebaseFirestore.instance.collection('ev1').doc('salon').snapshots();
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
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.redAccent)),
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'ODALAR ',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: (Colors.blueGrey),
                    fontSize: 17,
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
                            padding: EdgeInsets.only(right: 53),
                            child: Icon(
                              Icons.thermostat_outlined,
                              size: 30,
                              color: Colors.red,
                            )),
                        Container(
                          child: Icon(
                            Icons.priority_high_outlined,
                            size: 30,
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
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    margin: const EdgeInsets.all(25.0),
                    //color: Colors.white,
                    width: 335.0,
                    height: 80.0,

                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            width: 80.0,
                            height: 30.0,
                            child: Text(
                              'Salon : ',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Playfair',
                                fontWeight: FontWeight.bold,
                                color: (Colors.blueGrey),
                                fontSize: 17,
                              ),
                            )),
                        Container(
                            //padding: EdgeInsets.only(top: 70),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            width: 60.0,
                            height: 30.0,
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
                                  '${data['sicaklik']}°C',
                                  textAlign: TextAlign.center,
                                );
                              },
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
              ),
              margin: const EdgeInsets.all(5.0),
              //color: Colors.white,
              width: 335.0,
              height: 80.0,

              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      width: 80.0,
                      height: 25.0,
                      child: Text(
                        'Mutfak : ',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'ArcelikTurkish',
                          fontWeight: FontWeight.bold,
                          color: (Colors.blueGrey),
                          fontSize: 17,
                        ),
                      )),
                  Container(
                      //padding: EdgeInsets.only(top: 70),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      width: 60.0,
                      height: 20.0,
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
                            '${data['sicaklik']}°C',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'ArcelikTurkish'),
                          );
                        },
                      )),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      width: 20.0,
                      height: 50.0,

                      /*child: Icon(
                      Icons.thermostat_outlined,
                      color: Colors.red,
                      size: 40,
                    ),*/
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
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      width: 60.0,
                      height: 20.0,
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
                            textAlign: TextAlign.center,
                          );
                        },
                      )),
                  Container(
                    width: 60,
                    height: 30,
                    /*
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(bg_color),
                      ),
                      icon: Icon(
                        Icons.settings_outlined,
                        color: Colors.red,
                        size: 35,
                      ),
                      label: Text(""),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const temperature(
                                    title: '',
                                  )),
                        );
                      },
                    ),*/
                    child: FlatButton(
                      child: Icon(
                        Icons.settings_outlined,
                        color: Colors.red,
                        size: 35,
                      ),
                      color: bg_color,
                      onPressed: () {},
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
/*      
      floatingActionButton: FloatingActionButton(
        //tooltip: 'Increment',
        child: const Icon(Icons.arrow_back_outlined),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const anasayfa()),
          );
        },
      ),*/
/*
Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.thermostat_outlined)),
                  Container(child: Icon(Icons.priority_high_outlined)),
                  */
