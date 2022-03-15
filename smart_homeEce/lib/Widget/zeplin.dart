import 'dart:async';
import 'dart:math' as math;
import 'dart:math';
import 'package:intl/intl.dart';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:smart_home/Widget/anasayfa.dart';

class zeplin extends StatefulWidget {
  const zeplin({Key? key}) : super(key: key);

  @override
  _zeplinState createState() => _zeplinState();
}

class _zeplinState extends State<zeplin> {
  Color btn_color = const Color.fromRGBO(233, 240, 245, 1.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zeplin Deneme"),
      ),
      body: Center(
          child: Container(
              margin: const EdgeInsets.all(30),
              child: (
                  // Frame 1
// Group 1
                  Stack(
                children: [
                  // Rectangle 1
                  PositionedDirectional(
                    top: 0,
                    start: 0,
                    child: Container(
                        width: 329,
                        height: 122,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(34)),
                            color: const Color(0x63c4c4c4))),
                  ),
                  // Salon:
                  PositionedDirectional(
                    top: 33,
                    start: 9,
                    child: Text("Salon:",
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Nunito",
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0),
                        textAlign: TextAlign.left),
                  ),
                  // Ellipse 2
                  PositionedDirectional(
                    top: 81,
                    start: 199,
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
                                          child: Text('On'), value: 'Doge'),
                                      PopupMenuItem<String>(
                                          child: Text('Circulate'),
                                          value: 'Lion'),
                                      PopupMenuItem<String>(
                                          child: Text('Auto'), value: 'Lion'),
                                      PopupMenuItem<String>(
                                          child: Text('Off'), value: 'Lion'),
                                    ],
                                onSelected: (_) {}))
                      ]),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(btn_color),
                      ),
                      onPressed: () {},
                    ),
                    /*
                            color: const Color(0x40000000),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0)
                       color: const Color(0xffc4c4c4))*/
                  ),
                  // Ellipse 3
                  PositionedDirectional(
                    top: 81,
                    start: 91,
                    child: Container(
                        width: 58,
                        height: 27,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: const Color(0x40000000),
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 0)
                        ], color: const Color(0xffc4c4c4))),
                  ),
                  // TEMP
                  PositionedDirectional(
                    top: 37,
                    start: 96,
                    child: Text("TEMP",
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Nunito",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left),
                  ),
                  // HUM
                  PositionedDirectional(
                    top: 37,
                    start: 204,
                    child: Text("HUM",
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Nunito",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left),
                  ),
                  // Star 1
                  PositionedDirectional(
                    top: 29,
                    start: 288,
                    child: Container(
                      width: 32,
                      height: 33,
                      decoration: BoxDecoration(color: const Color(0xffff0000)),
                    ),
                  )
                ],
              )))),
    );
  }
}
