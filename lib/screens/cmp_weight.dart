import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:keto_app/controller/services/session_controller.dart';
import 'package:http/http.dart' as http;
class WeightCompare extends StatefulWidget {
  const WeightCompare({super.key});

  @override
  State<WeightCompare> createState() => _WeightCompareState();
}

class _WeightCompareState extends State<WeightCompare> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController cur_weight=TextEditingController();
  TextEditingController prev_weight=TextEditingController(text: SessionController().weight.toString());

createAlertDialog1(BuildContext context){
  return showDialog(context: context, builder: (context)
  {
    return AlertDialog(
      title: Text("Nice! You are loosing weight\nKeep Diet Continue"),
    );
  }
  
  );
}

createAlertDialog2(BuildContext context){
  return showDialog(context: context, builder: (context)
  {
    return AlertDialog(
      title: Text("Your weight is same as your previous weight\n Please tell Food Provider"),
    );
  }
  
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
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
        title: const Text(
          'Compare Weight',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(children: [
                     TextFormField(
                          
                          controller: cur_weight,
                          keyboardType: TextInputType.number,
                           decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                              hintText: 'current weight',
                              fillColor: Colors.white,
                              filled: true,
                              //prefixIcon: Icon(Icons.numbers),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: "Enter Current Weight in kgs",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepOrange),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter weight';
                              }
                              
                              return null;
                            },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                         
                          controller: prev_weight,
                          keyboardType: TextInputType.number,
                           decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                              hintText: 'previous weight',
                              fillColor: Colors.white,
                              filled: true,
                              //prefixIcon: Icon(Icons.numbers),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: "Enter Previous Weight in kgs",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepOrange),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter weight';
                              }
                              
                              return null;
                            },
                        ),
                  ]),
                ),
                SizedBox(height : 20),
                 Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: () async{
                  String url = 'https://fcm.googleapis.com/fcm/send' ;
                  final userToken =FirebaseFirestore.instance.collection('User Data');


                  if(_formKey.currentState!.validate())
                  {
                  double current_wt=double.parse(cur_weight.text);
                  double previous_wt=double.parse(prev_weight.text);
                 if(current_wt>previous_wt)
                  userToken.doc('A21jKYpvx9UgbhT4SplN0IVrcXZ2').get().then((value) async {

                  
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
                            'notification': <String, dynamic>{
                              "title": 'Hello Admin',
                              "body": 'I am not loosing weight admin? Your diet is not working ?',
                              "android_channel_id": "dbfood"
                            },
                            "to": value.get('token'),
                          }));

                      print(response);

                    } catch (e) {
                      print(e);
                      if (kDebugMode) {
                        print("error push notifications");
                        print(e.toString()) ;
                      }
                    }
                  });
                  }
                },
                
                color: Colors.deepOrangeAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Text(
                  "Send Alert",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              )
            ),
              ],
          ),
          
          )
        ],
      ),
    );
  }
}