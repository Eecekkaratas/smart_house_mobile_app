import 'package:flutter/material.dart';
import 'package:smart_home/Widget/humudity.dart';
import 'package:smart_home/Widget/light.dart';
import 'package:smart_home/Widget/temperature.dart';
import 'package:flutter/src/material/colors.dart';
//import 'package:smart_home/Widget/temperature.dart';
//import 'package:smart_home_v4/Widget/temperature.dart';

class anasayfa extends StatefulWidget {
  const anasayfa({Key? key}) : super(key: key);

  @override
  _anasayfa createState() => _anasayfa();
}

class _anasayfa extends State<anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.pink,
      /* appBar: AppBar(
          title: Text("Home"),
          ),*/
      body: Center(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 70),
                child: Text(
                  'APP ',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: (Colors.blueGrey),
                    fontSize: 17,
                  ),
                )),
            Container(
                padding: EdgeInsets.only(top: 80, bottom: 60),
                child: Text(
                  'APP  2  ',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: (Colors.blueGrey),
                    fontSize: 17,
                  ),
                )),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Container(
                    //decoration: BoxDecoration(
                    //border: Border.all(color: Colors.blueAccent),
                    // borderRadius: BorderRadius.all(const Radius.circular(2000))),
                    margin: const EdgeInsets.all(15.0),
                    //color: Colors.white,
                    width: 120.0,
                    height: 120.0,

                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 30.0,
                                spreadRadius: 5.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(15.0, -10.0),
                                blurRadius: 200.0,
                                spreadRadius: 10.0,
                              ), //BoxShadow
                            ],
                            borderRadius:
                                BorderRadius.all(const Radius.circular(50)),
                          ),
                          width: 90.0,
                          height: 90.0,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(color: Colors.grey))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey.shade200),
                            ),
                            icon: Icon(
                              Icons.thermostat_outlined,
                              color: Colors.red,
                              size: 50,
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
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Sıcaklık',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (Colors.blueGrey),
                                fontSize: 17,
                              ),
                            )),
                      ],
                    ),
                  ),
                  /////////////////////
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green,
                            offset: const Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 30.0,
                            spreadRadius: 5.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.green,
                            offset: const Offset(10.0, 8.0),
                            blurRadius: 200.0,
                            spreadRadius: 10.0,
                          ), //BoxShadow
                        ],
                        borderRadius:
                            BorderRadius.all(const Radius.circular(50)),
                      ),
                      margin: const EdgeInsets.all(10.0),
                      //color: Colors.yellow,
                      width: 100.0,
                      height: 100.0,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.red))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.shade200),
                        ),
                        label: Text("Light"),
                        icon: Icon(
                          Icons.tungsten_outlined,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const light(
                                      title: '',
                                    )),
                          );
                        },
                      )),
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green,
                            offset: const Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 30.0,
                            spreadRadius: 5.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.green,
                            offset: const Offset(10.0, 8.0),
                            blurRadius: 200.0,
                            spreadRadius: 10.0,
                          ), //BoxShadow
                        ],
                        borderRadius:
                            BorderRadius.all(const Radius.circular(50)),
                      ),
                      margin: const EdgeInsets.all(10.0),
                      //color: Colors.yellow,
                      width: 90.0,
                      height: 90.0,
                      /*
              child: ElevatedButton(
                child: Text("Humidity"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const humudity(
                              title: '',
                            )),
                  );
                },
              ),*/
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.green))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        label: Text("Humidity"),
                        icon: Icon(
                          Icons.priority_high_outlined,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const humudity(
                                      title: '',
                                    )),
                          );
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
