
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:keto_app/screens/welcome_screen.dart';


Future<void> backgroundhandler(RemoteMessage message )async{
 // print("This is a message from background");
  //print(message.notification!.title);
  // print(message.notification!.body);
}


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundhandler);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Welcome(),
  ));
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*
void initState() {
  super.initState();
    configOneSignel();
  }

  void configOneSignel()
  {
    OneSignal.shared.setAppId('d9e810d3-bbce-4946-b10b-2f6260cfa61f');
  }*/

  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
    );
    
   
  }
}
