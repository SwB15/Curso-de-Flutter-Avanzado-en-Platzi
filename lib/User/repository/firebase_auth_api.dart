import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User> signIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    User user = (await _auth.signInWithCredential(GoogleAuthProvider.credential(
        idToken: gSA.idToken, accessToken: gSA.accessToken))) as User;

    return user;
  }

  void signOut() async {
    await _auth.signOut().then((onValue) => print("Sesion cerrada"));
    _googleSignIn.signOut();
    print("Sesiones Cerradas");
  }
}
