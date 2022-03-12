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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: [
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                width: 200.0,
                height: 200.0,

                
                child: StreamBuilder<DocumentSnapshot>(
                  stream: salon,
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong.');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    }

                    final data = snapshot.requireData;

                    return Text(
                        'The room of ${data.id}\'s temperature is ${data['sicaklik']} degree.');
                  },
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log(docName);
          print(docName);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
