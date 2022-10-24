import 'package:flutter/material.dart';
import 'package:keto_app/screens/login_page2.dart';
import 'package:keto_app/screens/signup_page2.dart';
import 'package:keto_app/wrapper.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignUpScreenUser(),
    );
  }
}
