
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:keto_app/Services/auth.dart';
import 'package:keto_app/models/user_data.dart';
import 'package:keto_app/screens/alert_dialog_logout.dart';
import 'package:keto_app/screens/viewuserpage.dart';
import 'package:http/http.dart' as http;
import 'package:keto_app/Services/db.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:keto_app/screens/signup_page2.dart';




class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key, }) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String?  mtoken=" ";
  DBservice userid=DBservice();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
  late AndroidNotificationChannel channel;
  final AuthService _auth = AuthService(FirebaseAuth.instance);
  
  TextEditingController tokenid=TextEditingController();
  TextEditingController title=TextEditingController();
  TextEditingController body=TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final List<BottomNavigationBar> items=[];
String? notificationMsg;
  @override
  void initState() {
    super.initState();

   //foreground state
   FirebaseMessaging.instance.getInitialMessage();
    /*FirebaseMessaging.onMessage.listen((event) {
     setState(() {
    
        notificationMsg="${event.notification!.title} ${event.notification!.body} I am coming from foreground";

      });
      print("FCM message recieved");
    });*/
    requestPermission();
   //getToken();
   FCMload();
   FirebaseMessaging.onMessage.listen(showFlutterNotification);
   FirebaseMessaging.instance.subscribeToTopic('Keto_App');
    
  }
  //fCM load
  void FCMload()async {
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title

    importance: Importance.high,
    enableVibration: true,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );


  }

  //fcm listen 
  void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: 'launch_background',
        ),
      ),
    );
  }
}
//Request permission method
void requestPermission()async{
 FirebaseMessaging messaging =FirebaseMessaging.instance;

 NotificationSettings settings= await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true

 );

 if(settings.authorizationStatus==AuthorizationStatus.authorized)
 {
  print("user Granted Permission");
 }
 else if(settings.authorizationStatus==AuthorizationStatus.provisional)
 {
  print("User Granted Provisional Permission");
 }
 else
 {
  print("User declined or has not accepted permission");
 }
}
//get token method
/*void getToken()async{
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
}*/
  
 void sendPushMessage(String token, String title, String body) async
 {
  if (token =="") {
      print('Unable to send FCM message, no token exists.');
      return;
    }

  try{
   await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key=AAAAP8e6UWc:APA91bFr-t9z9roDnd27VqgG2GMIQN6Ze7yaxmKY21Ez06m49b5WZst66Wrfv5TvKs9TZHeeBX9CovxONiQ4DLRwTaR-5ushZsULsE689UezdvvS3hgcAOT0gFiZ-DuPCoZw6rymSgpQ',
        },
        body: jsonEncode(
         <String, dynamic> 
          {
          'priority': 'high',
           'data' : <String, dynamic>
           {
            'click_action' : 'FLUTTER_NOTIFICATION_CLICK',
            'status' : 'done',
             'body' : body,
             'title': title,
           },
           'notification' : <String, dynamic>
           {
           "title" : title,
           "body" : body,
           "android_channel_id" : "dbfood"
           },
           "to" : token,
          }
        )
   );
  }

  catch(e)
  { 
    print(e);
  if(kDebugMode)
  {
    print("error push notifications");
  }
  }
 }
  
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            const Text(
              'Admin Panel',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(width: 40),
             ElevatedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('Logout'),
              onPressed: () async {
                
                    final action=await AlertDialogs.yesCancelDialog(context, 'Logout', 'Are you sure you want to logout?');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Form(
  key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,   
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              controller: tokenid,
              
              decoration: InputDecoration(
                hintText: "Enter token",
              ),
              validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter tokens';
                              }
                              return null;
                              
                            },
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: title,
              
              decoration: InputDecoration(
                hintText: "Enter title",
              ),
              validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'title is required';
                              }
              }
            ),

            const SizedBox(height: 20),

            TextFormField(
              keyboardType: TextInputType.text,
              controller: body,
              decoration: InputDecoration(
  
                hintText: "Enter Today's Menu Details",
              ),
              validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Menu  is required';
                              }
                              return null;
              }
            ),
            const SizedBox(height: 20),
       // MaterialButton(
          
        // onPressed:() {
        //   if(_formKey.currentState!.validate())
           //{
           GestureDetector(
              
              onTap: () async{
                if(_formKey.currentState!.validate())
                {
                String tokenId=tokenid.text.trim();
                String user_title=title.text.trim();
                String user_body=body.text.trim();
               // if(tokenId!="")
                //{
                  
            
                  
                  DocumentSnapshot snap=await FirebaseFirestore.instance.collection("User Token").doc(FirebaseAuth.instance.currentUser!.uid).get();
                
                 
                   //var doc;
                  String token=snap['token'];
                // String token=doc.data()['token'];
                  print(token);
                  sendPushMessage(token, user_title, user_body);
              //  }
                
              };
              },
               child:  Container(
                        //"send",
                        margin: const EdgeInsets.all(20),
                        width: 100,
                        height: 40,
                        color: Colors.deepOrangeAccent,
                       child: Text(
                          "send",
                          textAlign: TextAlign.center,
                           style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        ),
             ),
            ),
        
       //  }
         // },
      //  color: Colors.deepOrangeAccent,
       /* child: Text(
                          "send",
                          textAlign: TextAlign.center,
                           style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        ),*/
         /* child:  Container(
                        //"send",
                        margin: const EdgeInsets.all(20),
                        width: 100,
                        height: 40,
                        color: Colors.deepOrangeAccent,*/
                       /* child: Text(
                          "send",
                          textAlign: TextAlign.center,
                           style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        ),*/
       // ),
          
          const SizedBox(height: 20),
          MaterialButton(
          
          onPressed:() {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewUserpage()));
          },
          color: Colors.deepOrangeAccent,
          child: const Text(
                        "view user data",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
          ),
      
          ]
        ),
            
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home
            ),
            label: 'Home',
            backgroundColor: Colors.white,
            
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.white,
            )
        ]
        
        
        ),
       
        );
     
    
  }
}