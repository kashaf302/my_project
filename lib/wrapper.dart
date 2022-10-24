import 'package:flutter/material.dart';
import 'package:keto_app/screens/authenticate/authenticate.dart';
import 'package:keto_app/screens/home_page.dart';
import 'package:keto_app/screens/login_page2.dart';
import 'package:provider/provider.dart';
import 'package:keto_app/models/user.dart';
//import 'package:js/js.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<User>(context);
    final user=context.watch<User>();
    // print(user);
    if (user != null) {
      return DietPlans();
    } else {
      return LoginScreenUser();
    }
  }
}
