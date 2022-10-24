
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keto_app/Services/db.dart';
import 'package:keto_app/models/user.dart' as UserModal;
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  AuthService(FirebaseAuth instance);

 Stream<User?> get authStateChanges => 
 _auth.authStateChanges();

//create a user object based on firebaseUser
  _userFromFirebaseUser(User? user) {
    return user != null ? UserModal.User(uid: user.uid) : null;
  }

//auth change user stream
  Stream<User> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

 

//Register
  Future<User?> register(String email, String password, String height,
      String weight, String address) async {
    //try {
      UserCredential usercred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = usercred.user;
      // create a document for the user with the uid
      await DBservice(uid: user!.uid).createUser(
          user.uid, email, double.parse(height), double.parse(weight), address);
      return null;
        
      //await DBservice(uid:user.uid).getUserDataList();
     // return _userFromFirebaseUser(user);
   /* } on FirebaseAuthException catch (e) {

      if (e.code == "Weak-Password") {
        print("The password provided is too weak");
      } else if (e.code == "email already in use") {
        print("The account already exists for that email");
      }

      
    } catch (e) {
      print(e.toString());
   
    }*/
  }

  //sign in
  Future<User?> signIn(String email, String password) async {
   // try {
      UserCredential usercred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return null;
          
    }
         // return null;
      //User? user = usercred.user;
    //  return _userFromFirebaseUser(user);
   /* on FirebaseAuthException catch (e) {
   
      if (e.code == 'user-not-found') {
        this._error='No user found for that email.';
      } 
      else if (e.code == 'wrong-password') 
      {
        this._error='Wrong password provided for that user.';
      
      }
     
    } catch (e) {
      print(e.toString());
    
    }
   
  }*/


//signout
  Future<bool> signout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
