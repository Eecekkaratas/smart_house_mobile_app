import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_home/Widget/register.dart';
import 'anasayfa.dart';
import 'auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authentication extends StatefulWidget {
  // Authentication({required Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hata'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Bilgilerinizi kontrol ediniz !'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //sarı-siyah hatası
      // appBar: AppBar(
      //   title: Text("ParKap", textAlign: TextAlign.center),
      //   automaticallyImplyLeading: false,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 25, top: 25),
              child: Text(
                "Parkap'a Hoşgeldiniz",
                style: new TextStyle(
                  fontSize: 30.0,
                  //color: Colors.yellow,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 25, top: 25),
              child: Container(
                child: TextFormField(
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
                child: TextFormField(
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20)),
                onPressed: () async {
                  bool shouldNavigate =
                      await signIn(_emailField.text, _passwordField.text);
                  if (shouldNavigate) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => anasayfa(),
                      ),
                    );
                  } else {
                    _showMyDialog();
                  }
                },
                child: const Text('Giriş'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                child: const Text('Kayıt Ol'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 0.0, right: 0.0, top: 20.0, bottom: 0.0),
              child: new RaisedButton(
                color: Color(0xff4285F4),
                elevation: 0.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(1.0)),
                padding: EdgeInsets.only(
                    top: 5.0, bottom: 5.0, right: 30.0, left: 5.0),
                onPressed: () {
                  signInWithGoogle();
                },
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset('assets/30062076636_c3f99ddcdd_m.jpg',
                        height: 40.0, width: 40.0),
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: new Text(
                          "Sign in with Google ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
