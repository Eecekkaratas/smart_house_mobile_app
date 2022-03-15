import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

String usernamex = "";

String str = "";
String getter() {
  return usernamex;
}

void setter(String setvar) {
  usernamex = setvar;
}

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<bool> register(String email, String password, String tel, String city,
    String username) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    var user = FirebaseAuth.instance.currentUser;
    user!.sendEmailVerification();
    String uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    var myJSONObj = {
      "username": username,
      "tel": tel,
    };
    await ref.doc(uid).set(myJSONObj);

    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

String setUsername() {
  // Trigger the authentication flow

  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance
      .collection("users")
      .doc(firebaseUser!.uid)
      .get()
      .then((value) {
    //print("BAK");
    //print(value.data());
    usernamex = value.data()!["username"];
    setter(usernamex);

    //print(str);
  });
  print(getter());
  return getter();
  //print(usernamex.toString());
  /*if (usernamex != null) {
    return usernamex;
  } else {
    return '';
  }*/
  //return usernamex.toString();
}
