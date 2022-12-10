import 'package:flutter/material.dart';
import 'package:keto_app/screens/welcome_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) =>Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Welcome())) );
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