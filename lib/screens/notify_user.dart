import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:keto_app/Services/auth.dart';
import 'package:keto_app/models/user_data.dart';
import 'package:http/http.dart' as http;
import 'package:keto_app/Services/db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keto_app/screens/alert_dialog_logout.dart';

class NotifyUser extends StatefulWidget {
  const NotifyUser({super.key});

  @override
  State<NotifyUser> createState() => _NotifyUserState();
}

class _NotifyUserState extends State<NotifyUser> {
   String? mtoken = " ";
  DBservice userid = DBservice();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  late AndroidNotificationChannel channel;
  final AuthService _auth = AuthService(FirebaseAuth.instance);

  TextEditingController tokenid = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final List<BottomNavigationBar> items = [];
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
    getData();
    //getToken();
    FCMload();
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    FirebaseMessaging.instance.subscribeToTopic('Keto_App');
  }

  DBservice db = DBservice();
  List<UserData> userData = [];

  getData() async {
    await db.fetchUserData().then((res) {
      setState(() {
        userData = res;
        print(userData);
        _selectedUser = userData[0];
      });
    });
  }

  UserData? _selectedUser = null;

  //fCM load
  void FCMload() async {
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
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
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
  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user Granted Permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("User Granted Provisional Permission");
    } else {
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

  void sendPushMessage(String token, String title, String body) async {
    if (token == "") {
      print('Unable to send FCM message, no token exists.');
      return;
    }

    try {
      final response =
      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':
            'key=AAAAP8e6UWc:APA91bFr-t9z9roDnd27VqgG2GMIQN6Ze7yaxmKY21Ez06m49b5WZst66Wrfv5TvKs9TZHeeBX9CovxONiQ4DLRwTaR-5ushZsULsE689UezdvvS3hgcAOT0gFiZ-DuPCoZw6rymSgpQ',
          },
          body: jsonEncode(<String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': body,
              'title': title,
            },
            'notification': <String, dynamic>{
              "title": title,
              "body": body,
              "android_channel_id": "dbfood"
            },
            "to": token,
          }));
      print(response);
    } catch (e) {
      print(e);
      if (kDebugMode) {
        print("error push notifications");
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.red,
        
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        
             const SizedBox(width: 20),
            const Text(
              'Notify User',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(width: 40),
             ElevatedButton.icon(
              icon: const Icon(Icons.person,
              color: Colors.black,
              ),
              label: const Text('Logout',
              style: TextStyle(
                color: Colors.black,
              ),
              
              ),
              onPressed: () async {
                
                    await AlertDialogs.yesCancelDialog(context, 'Logout', 'Are you sure you want to logout?');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
  
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (_selectedUser != null)
              DropdownButton<UserData>(
                value: _selectedUser,
                hint: const Text("Select User"),
                items: userData
                    .map(
                        (e) => DropdownMenuItem(child: Text(e.email), value: e))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedUser = value;
                  });
                },
              )
            else
              Center(
                child: CircularProgressIndicator(),
              ),
            const SizedBox(height: 20),

            // TextFormField(
            //   keyboardType: TextInputType.text,
            //   controller: tokenid,
            //   decoration: InputDecoration(
            //     hintText: "Enter token",
            //   ),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please enter tokens';
            //     }
            //     return null;
            //   },
            // ),

            // const SizedBox(height: 20),

            TextFormField(
                controller: title,
                decoration: InputDecoration(
                  hintText: "Enter title",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'title is required';
                  }
                }),

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
                }),
            const SizedBox(height: 20),
            // MaterialButton(

            // onPressed:() {
            //   if(_formKey.currentState!.validate())
            //{
            GestureDetector(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  String tokenId = tokenid.text.trim();
                  String user_title = title.text.trim();
                  String user_body = body.text.trim();
                  // if(tokenId!="")
                  //{

                  DocumentSnapshot snap = await FirebaseFirestore.instance
                      .collection("User Data")
                      .doc(_selectedUser!.userId)
                      .get();

                  //var doc;
                  String token = snap['token'];
                  print(token);
                  sendPushMessage(token, user_title, user_body);
                  //  }

                }
                ;
              },
              child: Container(
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

           
          ]),
        ),
      ),
    
    
    );
  }
}