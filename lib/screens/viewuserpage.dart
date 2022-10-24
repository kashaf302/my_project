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
  DBservice db = DBservice();
  List userData = [];

  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await db.fetchUserData().then((res) {
      setState(() {
        userData = res;
        print(userData);
      });
    });
  }

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
      body: ListView.builder(
        itemCount: userData.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(10.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepOrangeAccent,
            ),
            title: Text(
              userData[index].email,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            subtitle: Text(
              '${userData[index].weight} kg',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
