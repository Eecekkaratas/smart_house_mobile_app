import 'package:flutter/material.dart';

class temperature extends StatefulWidget {
  const temperature({Key? key}) : super(key: key);

  @override
  _temperature createState() => _temperature();
}

class _temperature extends State<temperature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Temperature"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('temperature'),
          onPressed: () {
            //Navigator.push(
            //  context,
            //  MaterialPageRoute(builder: (context) => const SecondRoute()),
            //);
          },
        ),
      ),
    );
  }
}
