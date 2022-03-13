import 'package:flutter/material.dart';
import 'package:smart_home/Widget/humudity.dart';
import 'package:smart_home/Widget/light.dart';
import 'package:smart_home/Widget/temperature.dart';
import 'package:flutter/src/material/colors.dart';
//import 'package:intl/intl.dart';

//import 'package:smart_home/Widget/temperature.dart';
//import 'package:smart_home_v4/Widget/temperature.dart';

class anasayfa extends StatefulWidget {
  const anasayfa({Key? key}) : super(key: key);

  @override
  _anasayfa createState() => _anasayfa();
}

class _anasayfa extends State<anasayfa> {
  late DateTime now;
  Color bg_color = const Color.fromRGBO(239, 246, 251, 1.0); //239R 246G 251B
  Color btn_color = const Color.fromRGBO(233, 240, 245, 1.0);

  Color btn_color2 =
      const Color.fromRGBO(222, 235, 238, 1.0); //Buton: 238R 245G 250B

  void _currentDate() {
    setState(() {
      //print(rng.nextInt(25));
      now = DateTime.now();
      print(now.hour.toString() +
          ":" +
          now.minute.toString() +
          ":" +
          now.second.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_color,
      /* appBar: AppBar(
          title: Text("Home"),
          ),*/
      body: Center(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 30),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                width: 320,
                height: 100,
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 60),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)),
                        //padding: EdgeInsets.only(top: 60),
                        child: Text(
                          'Smart Home System',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: (Colors.blueGrey),
                            fontSize: 20,
                          ),
                        ))
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Container(
                width: 320,
                height: 150,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Row(
                  children: [
                    Container(
                      child:
                          Image(image: AssetImage('assets/Screenshot_233.png')),
                      //padding: EdgeInsets.only(left: 20),
                      margin: EdgeInsets.only(left: 25),
                      width: 100,
                      height: 100,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.red)),
                      //child: Text("sa"),
                    ),
                    Container(
                        //padding: EdgeInsets.only(left: 20),
                        margin: EdgeInsets.only(left: 20),
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red)),
                        child: Text(
                          "sa",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ),
            ),
            Container(
                child: Row(
              children: [
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
                    ))
              ],
            )),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Row(children: [
                Container(
                  //decoration: BoxDecoration(
                  //border: Border.all(color: Colors.blueAccent),
                  // borderRadius: BorderRadius.all(const Radius.circular(2000))),
                  margin: const EdgeInsets.all(5.0),
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
                                offset: const Offset(10.0, 10.0),
                                blurRadius: 20.0,
                                spreadRadius: 0.1,
                              ), //BoxShadow
                            ],
                            borderRadius:
                                BorderRadius.all(const Radius.circular(50)),
                          ),
                          width: 90.0,
                          height: 90.0,
                          child: ElevatedButton(
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.thermostat_outlined,
                                    color: Colors.red,
                                    size: 45,
                                  ),
                                ),
                              ],
                            ),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const temperature(
                                          title: '',
                                        )),
                              );
                            },
                          )),
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
                  padding: EdgeInsets.only(top: 0),
                  child: Row(
                    children: [
                      Container(
                        //decoration: BoxDecoration(
                        //border: Border.all(color: Colors.blueAccent),
                        // borderRadius: BorderRadius.all(const Radius.circular(2000))),
                        //margin: const EdgeInsets.all(5.0),
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
                                      offset: const Offset(10.0, 10.0),
                                      blurRadius: 25.0,
                                      spreadRadius: 0.1,
                                    ), //BoxShadow
                                  ],
                                  borderRadius: BorderRadius.all(
                                      const Radius.circular(50)),
                                ),
                                width: 90.0,
                                height: 90.0,
                                child: ElevatedButton(
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.tungsten_outlined,
                                          color: Colors.red,
                                          size: 45,
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            btn_color),
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
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Işık',
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
                      ///////////////
                      Container(
                        padding: EdgeInsets.only(top: 0),
                        child: Row(
                          children: [
                            Container(
                              //decoration: BoxDecoration(
                              //border: Border.all(color: Colors.blueAccent),
                              // borderRadius: BorderRadius.all(const Radius.circular(2000))),
                              //margin: const EdgeInsets.all(5.0),
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
                                            offset: const Offset(10.0, 10.0),
                                            blurRadius: 25.0,
                                            spreadRadius: 0.1,
                                          ), //BoxShadow
                                        ],
                                        borderRadius: BorderRadius.all(
                                            const Radius.circular(50)),
                                      ),
                                      width: 90.0,
                                      height: 90.0,
                                      child: ElevatedButton(
                                        child: Stack(
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.priority_high_outlined,
                                                color: Colors.red,
                                                size: 45,
                                              ),
                                            ),
                                          ],
                                        ),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  btn_color),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const humudity(
                                                      title: '',
                                                    )),
                                          );
                                        },
                                      )),
                                  Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Işık',
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
