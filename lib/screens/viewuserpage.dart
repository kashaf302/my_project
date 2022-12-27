import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:keto_app/models/user_data.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Services/db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewUserpage extends StatefulWidget {
  const ViewUserpage({Key? key}) : super(key: key);

  @override
  State<ViewUserpage> createState() => _ViewUserpageState();
}

class _ViewUserpageState extends State<ViewUserpage> {

  final ref = FirebaseFirestore.instance.collection('User Data').snapshots();


  @override
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
        title: Text('User Data List',
        style: TextStyle(
          color: Colors.black,
        )
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: ref ,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }else {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document){
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return                 Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                    title: Text(
                      data['Email'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    subtitle: Text(
                      '${data['Weight'].toString()} kg',
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ) ;
;
              }).toList(),
            );

          }
        },
      ),
    );
  }
}
