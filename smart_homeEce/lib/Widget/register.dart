import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'anasayfa.dart';
import 'auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  static final String title = 'Dropdown Button';
  @override
  _RegisterState createState() => _RegisterState();
}

class NewObject {
  final String title;
  final IconData icon;

  NewObject(this.title, this.icon);
}

class _RegisterState extends State<Register> {
  //bool value = false;
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  TextEditingController _cityField = TextEditingController();
  TextEditingController _usernameField = TextEditingController();
  TextEditingController _telField = TextEditingController();
  @override
  static final List<NewObject> items = <NewObject>[
    NewObject('İstanbul', Icons.home_work_outlined),
    NewObject('Ankara', Icons.home_work_outlined),
    NewObject('İzmir', Icons.home_work_outlined),
    NewObject('Antalya', Icons.home_work_outlined),
  ];

  NewObject value = items.first;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Kayıt Ol"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Container(
                child: TextField(
                  controller: _emailField,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      //labelText: 'Email',
                      hintText: 'Email:'),
                ),
                width: 320,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Container(
                child: TextField(
                  controller: _usernameField,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      //labelText: 'Email',
                      hintText: 'Kullanıcı Adı:'),
                ),
                width: 320,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Container(
                child: TextField(
                  controller: _passwordField,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      //labelText: 'Email',
                      hintText: 'Şifre:'),
                ),
                width: 320,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Container(
                child: TextField(
                  controller: _telField,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      //labelText: 'Email',
                      hintText: 'Telefon Numarası:'),
                ),
                width: 320,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: buildDropdown(),
            ),
            ElevatedButton(
              onPressed: () async {
                bool shouldNavigate = await register(
                    _emailField.text,
                    _passwordField.text,
                    _telField.text,
                    value.title,
                    _usernameField.text);
                if (shouldNavigate) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => anasayfa(),
                    ),
                  );
                }
              },
              child: Text('Kayıt Ol'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown() => Container(
        width: 320,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(
              color: Color(0xffb9b9b9), width: 1), //color: Color(0xff4285F4),
        ),
      );
}
