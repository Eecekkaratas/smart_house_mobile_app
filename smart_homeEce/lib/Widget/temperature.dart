import 'dart:math';

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

  String docName =
      FirebaseFirestore.instance.collection('odalar').doc().id; // Useles atm.

  final Stream<DocumentSnapshot> salon =
      FirebaseFirestore.instance.collection('ev1').doc('salon').snapshots();
  Color bg_color = const Color.fromRGBO(239, 246, 251, 1.0);
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
      /*appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),*/

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
                            padding: EdgeInsets.only(right: 53),
                            child: Icon(
                              Icons.thermostat_outlined,
                              size: 40,
                              color: Colors.red,
                            )),
                        Container(
                          child: Icon(
                            Icons.priority_high_outlined,
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
                            '${data['sicaklik']}°C',
                            //style: GoogleFonts.nunito(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
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
                      width: 70.0,
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
                  Container(
                    width: 60,
                    height: 40,
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
                          title: const Text('Otomatik Sıcaklık Ayarlama'),
                          content: Container(
                            //width: 90,
                            height: 180,

                            child: Column(
                              children: [
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white)),
                                  //padding: EdgeInsets.only(top: 20),
                                  child: Switch(
                                    value: isSwitchedS,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitchedS = value;
                                      });
                                    },
                                    activeTrackColor: Colors.lightGreenAccent,
                                    activeColor: Colors.green,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white)),
                                  //padding: EdgeInsets.only(top: 40),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white)),
                                        //padding: EdgeInsets.only(top: 20),
                                        child: Text("Min:"),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white)),
                                        height: 30,

                                        padding: EdgeInsets.only(left: 10),
                                        margin:
                                            const EdgeInsets.only(left: 20.0),

                                        //child: Text("Değer:"),

                                        child: SizedBox(
                                          width: 100,
                                          child: TextField(
                                            controller: myController_S1_min,
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 40),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white)),
                                        //padding: EdgeInsets.only(top: 20),
                                        child: Text("Max:"),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white)),
                                        height: 30,

                                        padding: EdgeInsets.only(left: 10),
                                        margin:
                                            const EdgeInsets.only(left: 20.0),

                                        //child: Text("Değer:"),

                                        child: SizedBox(
                                          width: 100,
                                          child: TextField(
                                            controller: myController_S1_max,
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      ),
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
                  )
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

                          /*double doubleInRange(
                                  Random random, double end, double start) =>
                              (random.nextDouble() * (end - start) + start);*/

                          var rng = new Random();

                          return Text(
                            '${data['sicaklik'] + rng.nextInt(4).toDouble() / 10}°C',
                            //style: GoogleFonts.nunito(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
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
                      width: 70.0,
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
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          );
                        },
                      )),
                  Container(
                    width: 80,
                    height: 40,
                    padding: EdgeInsets.only(left: 10),
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
                            borderRadius: new BorderRadius.circular(30.0))),
                  ),
                  /*child: Align(
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.settings_outlined,
                          color: Colors.red,
                          size: 35,
                        ),
                        label: (""),
                        onPressed: () {},
                      ),
                      */
                  /*
                      child: Icon(
                        Icons.settings_outlined,
                        color: Colors.red,
                        size: 35,
                      ),*/
                  //color: bg_color,
                  //onPressed: () {},
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
                            /*style: const TextStyle(
                              fontFamily: 'Nunito-Regular',
                              fontWeight: FontWeight.bold,
                              color: (Colors.blueGrey),
                              fontSize: 17,
                            ),*/
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
                      width: 70.0,
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
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          );
                        },
                      )),
                  TempPopup(
                    minController: myController_S3_min,
                    maxController: myController_S3_max,
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
                        'Oda 2 : ',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Nunito-Light',
                          fontWeight: FontWeight.bold,
                          color: (Colors.blueGrey),
                          fontSize: 25,
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
                          var rng = new Random();

                          return Text(
                            '${data['sicaklik'] - rng.nextInt(4) / 10 + 0.1}°C',
                            //style: GoogleFonts.nunito(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
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
                      width: 70.0,
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
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          );
                        },
                      )),

                  ///KOPYA BUTON
                  TempPopup(
                      minController: myController_S4_min,
                      maxController: myController_S4_max),
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
  const TempPopup({
    Key? key,
    required this.minController,
    required this.maxController,
  }) : super(key: key);

  final TextEditingController minController;
  final TextEditingController maxController;

  @override
  _TempPopup createState() => _TempPopup();
}

class _TempPopup extends State<TempPopup> {
  bool isSwitchedS = true;
  bool isSwitchedM = true;
  bool isSwitchedO1 = true;
  bool isSwitchedO2 = true;
  @override
  TempPopup get widget => super.widget;
  @override
  Widget build(BuildContext context) {
    bool isSwitchedS = false;
    return Container(
      width: 60,
      height: 40,
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
            title: const Text('Otomatik Sıcaklık Ayarlama'),
            content: Container(
              //width: 90,
              height: 180,

              child: Column(
                children: [
                  Container(
                    height: 40,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    //padding: EdgeInsets.only(top: 20),
                    child: Switch(
                      value: isSwitchedS,
                      onChanged: (value) {
                        setState(() {
                          isSwitchedS = !isSwitchedS;
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                  ),
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
                          child: Text("Min:"),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          height: 30,

                          padding: EdgeInsets.only(left: 10),
                          margin: const EdgeInsets.only(left: 20.0),

                          //child: Text("Değer:"),

                          child: SizedBox(
                            width: 100,
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
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          //padding: EdgeInsets.only(top: 20),
                          child: Text("Max:"),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          height: 30,

                          padding: EdgeInsets.only(left: 10),
                          margin: const EdgeInsets.only(left: 20.0),

                          //child: Text("Değer:"),

                          child: SizedBox(
                            width: 100,
                            child: TextField(
                              controller: widget.maxController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
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
