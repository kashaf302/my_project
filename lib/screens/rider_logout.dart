import 'package:flutter/material.dart';
import 'package:keto_app/Services/auth.dart';
import 'package:keto_app/screens/login_page2.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum DialogsAction{yes,cancel}

class AlertDialogs{
  static  Future<DialogsAction?> yesCancelDialog(BuildContext context, String title, String body)async 
  {

    final action=await showDialog(context: context,
    barrierDismissible: false,
     builder:  (BuildContext context){
      return AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        ElevatedButton(
          onPressed: () {
          Navigator.of(context).pop(DialogsAction.cancel);
            
          },
           child: Text('Cancel', style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            
            )
           ),
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent,
           ),
           ),
        ElevatedButton(
          onPressed: () async{
            final AuthService _auth = AuthService(FirebaseAuth.instance);
            await _auth.signout().whenComplete(() => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreenUser())),
                    });
          },
           child: Text('Yes', style: TextStyle(
            color: Colors.black,
            fontSize: 20,
           
           )
           ),
           style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent,
           ),
           ),
      ],
      );
     }
     );
     return (action!=null) ? action : DialogsAction.cancel;

  }
  
}