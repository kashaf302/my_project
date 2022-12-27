import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:keto_app/controller/services/session_controller.dart';
//import 'package:keto_app/main.dart';
import 'package:keto_app/screens/admin_screen.dart';
import 'package:keto_app/screens/home_page.dart';
import 'package:keto_app/screens/rider_screen.dart';
import 'package:keto_app/screens/welcome_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final message = FirebaseMessaging.instance ;
  final auth = FirebaseAuth.instance ;
  final ref = FirebaseFirestore.instance.collection('User Data');


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    final user = auth.currentUser ;


    if(user != null){

      final userToken =FirebaseFirestore.instance.collection('User Token');
      final message = FirebaseMessaging.instance ;

      message.getToken().then((newValue){
        print(newValue);
        userToken.doc(user!.uid.toString()).set({
          'token' : newValue.toString() ,
          'userId' : user!.uid.toString()
        });
      });

      ref.doc(user!.uid.toString()).get().then((value){

        SessionController().userId = user.uid.toString();
        SessionController().weight = value.get('Weight').toString();

        if(value.get('role') == 'user'){
          Navigator.push(context,MaterialPageRoute(
              builder: (context) =>DietPlans()));
        }else if(value.get('role') == 'admin'){
          Future.delayed(Duration(seconds: 2)).then((value) =>Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  AdminScreen())));
        }else if(value.get('role') == 'rider'){

          Future.delayed(Duration(seconds: 2)).then((value) =>Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  RiderScreen())));
        }

      });


    }else {

      print(user);
      Future.delayed(Duration(seconds: 2)).then((value) =>Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>  Welcome())) );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Center(

        child: Container(
          height: 200,
          width: 200,
          child: LottieBuilder.asset('assets/animation/loading-animation.json'),
        ),
      ),
    );
  }
}