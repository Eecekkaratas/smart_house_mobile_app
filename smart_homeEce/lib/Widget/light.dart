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

class NoteModel {
  String title;
  String content;

  NoteModel({
    required this.title,
    required this.content,
  });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("light"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              width: 200.0,
              height: 200.0,
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

                  final data = snapshot.requireData;
                  if (data['aydinlatma'] == 1) {
                    return const Text('The room\'s lights are on!');
                  } else {
                    return const Text('The room\'s lights are off!');
                  }
                },
              ),
              //mainAxisAlignment: MainAxisAlignment.center,
              /*
                child: StreamBuilder<QuerySnapshot>(
                  stream: users,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong.');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    }

                    final data = snapshot.requireData;

                    return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return Text(
                            'The room temperature is ${data.docs[index]['sicaklik']}');
                      },
                    );
                  },
                )
              ),
                */
            ),
            Container(
              
              child: ElevatedButton(
                child: Text("sa"),
                onPressed: () async {
                  //await users.collection("notes").doc("doc-id").update(noteToUpdate.toMap());
                },
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
