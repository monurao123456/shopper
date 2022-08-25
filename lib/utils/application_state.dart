import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum ApplicaationLoginState { loggedOut, loogedIn }

class ApplicationState extends ChangeNotifier {
  User? user;
  ApplicaationLoginState loginState = ApplicaationLoginState.loggedOut;
  ApplicationState() {
    init();
  }
  Future<void> init() async {
    FirebaseAuth.instance.userChanges().listen((userFir) {
      if (userFir != null) {
        loginState = ApplicaationLoginState.loogedIn;
        user = userFir;
      } else {
        loginState = ApplicaationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  Future<void> signIn(String email, String password,
      void Function(FirebaseAuthException e) errorCallBack) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallBack(e);
    }
  }

  Future<void> signUp(String email, String password,
      void Function(FirebaseAuthException e) errorCallBack) async {
    try {
      //stripe user create
    } on FirebaseAuthException catch (e) {
      errorCallBack(e);
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
