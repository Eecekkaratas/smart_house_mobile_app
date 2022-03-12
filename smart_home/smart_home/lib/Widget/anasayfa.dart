import 'package:flutter/material.dart';
import 'package:smart_home/Widget/temperature.dart';
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
      /* appBar: AppBar(
          title: Text("Home"),
          ),*/
      body: Center(
        child: Row(
          children: [
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              margin: const EdgeInsets.all(10.0),
              //color: Colors.pink,
              width: 90.0,
              height: 90.0,
              child: ElevatedButton(
                child: Text("Sıcaklık"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const temperature(title: '',)),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              //color: Colors.yellow,
              width: 90.0,
              height: 90.0,
              child: ElevatedButton(
                child: Text("Light"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const temperature(title: '',)),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              //color: Colors.yellow,
              width: 90.0,
              height: 90.0,
              child: ElevatedButton(
                child: Text("Humidity"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const temperature(title: '',)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
