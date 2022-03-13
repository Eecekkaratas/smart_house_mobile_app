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

class light extends StatefulWidget {
  const light({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _light createState() => _light();
}

class _light extends State<light> {
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
                              //style: GoogleFonts.nunito(),
                              /*
                              style: const TextStyle(
                                fontFamily: 'Nunito-Regular',
                                fontWeight: FontWeight.bold,
                                color: (Colors.blueGrey),
                                fontSize: 17,
                              ),*/
                            )),
                        Container(
                            //padding: EdgeInsets.only(top: 70),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            width: 60.0,
                            height: 30.0,
                            child: StreamBuilder<DocumentSnapshot>(
                              stream: users,
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
                                  style: const TextStyle(
                                    fontFamily: 'Nunito-Regular',
                                    fontWeight: FontWeight.bold,
                                    color: (Colors.blueGrey),
                                    fontSize: 17,
                                  ),
                                );
                              },
                            )),
                      ],
                    ),
                  ),
                ],

                /* Container(
                    width: 60,
                    height: 30,
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
                 */
                /*Container(
                    padding: EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                      //child: Text("sa"),

                      onPressed: () async {
                        if (data['aydinlatma'] == 1) {
                          collection
                              .doc(
                                  'salon') // <-- Doc ID where data should be updated.
                              .update({'aydinlatma': 0});
                        } else {
                          collection
                              .doc(
                                  'salon') // <-- Doc ID where data should be updated.
                              .update({'aydinlatma': 1});
                        }

                        //await users.collection("notes").doc("doc-id").update(noteToUpdate.toMap());
                      },
                      child: null,
                    ),
                  ),*/
              ),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/*Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              width: 200.0,
              height: 200.0,
              /*
              child: Baseline(
                baseline: 25,
                baselineType: TextBaseline.alphabetic,*/
              child: Container(
                width: 100.0,
                height: 100.0,
                child: StreamBuilder<DocumentSnapshot>(
                  stream: users,
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong.');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    }

                    data = snapshot.requireData;
                    if (data['aydinlatma'] == 1) {
                      return const Text('The room\'s lights are on!');
                    } else {
                      return const Text('The room\'s lights are off!');
                    }
                  },
                ),
              ),
              //),
            ), */