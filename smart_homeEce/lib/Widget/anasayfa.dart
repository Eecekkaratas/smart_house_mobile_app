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
  Color bg_color = const Color.fromRGBO(239, 246, 251, 1.0); //239R 246G 251B
  Color btn_color = const Color.fromRGBO(233, 240, 245, 1.0);

  Color btn_color2 =
      const Color.fromRGBO(222, 235, 238, 1.0); //Buton: 238R 245G 250B
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
                      /*child: ElevatedButton.icon(
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
                          icon: Icon(
                            Icons.thermostat_outlined,
                            color: Colors.red,
                            size: 50,
                            //IconAlign: TextAlign.center,
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
                                )
                                /*
                              child: ElevatedButton.icon(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          btn_color2),
                                ),
                                icon: Icon(
                                  Icons.tungsten_outlined,
                                  color: Colors.red,
                                  size: 50,
                                ),
                                label: Text(""),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const light(
                                              title: '',
                                            )),
                                  );
                                },
                              ),*/
                                ),
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
                                      )
                                      /*
                                    child: ElevatedButton.icon(
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
                                                Colors.grey.shade200),
                                      ),
                                      icon: Icon(
                                        Icons.priority_high_outlined,
                                        color: Colors.red,
                                        size: 50,
                                      ),
                                      label: Text(""),
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
                                    ),*/
                                      ),
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
//Icons.tungsten_outlined
//Icons.priority_high_outlined,

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
