import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:keto_app/screens/admin_screen.dart';
import '../models/user_data.dart';


class DBservice {
  final db = FirebaseFirestore.instance;
  final db_amount=FirebaseFirestore.instance;
  final String uid;
  DBservice({this.uid = ''});

String? mtoken;
 /*Future<void> getToken()async{
  await FirebaseMessaging.instance.getToken().then((token)
     {
       
        //mtoken=token;
         print("My token is $token");
     
     
     }
  );
}*/
  //add data to firestore
  Future<void> createUser(String uid, String email, double height,
      double weight, String address) async {
        
    //Creates the user doc named whatever the user uid is in te collection "users"
    //and adds the user data
    await db
        .collection('User Data')
        .doc()
        .set({
          'userId': uid,
          'Email': email,
          'Height': height,
          'Weight': weight,
          'Address': address,
          //'Token' : '$mtoken',
          'role'  : 'user'
        })
        .then((value) => print("User has registered successfully"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  //get user data stream from firestore
  Future<List<UserData>> fetchUserData() async {
     List<UserData> userData = [];
    await db.collection('User Data').get().then((QuerySnapshot snapshot) {
      for (var v in snapshot.docs) {
        UserData uData = UserData(
            userId: v['userId'],
            email: v['Email'],
            height: v['Height'],
            weight: v['Weight'],
            address: v['Address'],
          
           );
            userData.add(uData);
      }
    }
    );
    return userData;
  }


  //payment  method
/*Future<void> storePhoneNo(String phone_No) async
{
await db.collection("Payment Method").doc().set(
  {
    "Phone No": phone_No,
  }
).then((value)=> print("Payment has been submitted successfully"))
.catchError((error) => print("Failed to submit payment: $error"));
}*/



}

