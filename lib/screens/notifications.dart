
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:keto_app/screens/home_page.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String notificationMsg="Waiting for notifications";
  String? mtoken;
  @override
  void initState(){

    super.initState();
    //terminated state
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if(event!=null)
      {
       setState(() {
        notificationMsg="${event.notification!.title} ${event.notification!.body} I am coming from terminated state";

      });
      }
      
    });

    //foreground state
    FirebaseMessaging.onMessage.listen((event) {
      setState(() {
        notificationMsg="${event.notification!.title} ${event.notification!.body}";

      });
     print("FCM message recieved");
     });

//background state
   FirebaseMessaging.onMessageOpenedApp.listen((event) {
      setState(() {
        notificationMsg="${event.notification!.title} ${event.notification!.body}";
        
      });
    });
    getToken();
  }

 
//get token method
void getToken()async{
  await FirebaseMessaging.instance.getToken().then((token)
     {
      setState(() {
         mtoken=token;
         print("My token is $mtoken");
      });
      saveToken(token!);
     }
  );
}

//save token
void saveToken(String token)async{
await FirebaseFirestore.instance.collection("User Token").doc(FirebaseAuth.instance.currentUser!.uid).set({
    "token" : token,

});
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
         automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

         Text("Notifications",
        style: TextStyle(
          color: Colors.black,
        ),
        ),
        const SizedBox(width: 20),
        ElevatedButton.icon(
              icon: Icon(Icons.home,
              color: Colors.black,
              ),
              label: Text('Home',
              style: TextStyle(
                color: Colors.black
              ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DietPlans()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent
              ),
            ),
        ],
      ),
      ),
      body: Center(
        child: Text(notificationMsg,
        textAlign: TextAlign.center,
        
        ), 
      ),
    );
  }
}