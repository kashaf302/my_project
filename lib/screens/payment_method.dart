import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:keto_app/Services/auth.dart';
import 'package:keto_app/Services/db.dart';
import 'package:keto_app/screens/cmp_weight.dart';
import 'package:keto_app/screens/notifications.dart';
import 'package:keto_app/screens/plans_data.dart';
import 'package:keto_app/screens/login_page2.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class PaymentScreen extends StatefulWidget {
  final Plans plans;
   PaymentScreen({Key? key, required this.plans}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
final _formKey = GlobalKey<FormState>();

  DBservice db=DBservice();

  TextEditingController number=TextEditingController();

  CollectionReference payment=FirebaseFirestore.instance.collection("Payment");

  String jazcash_num="";

  

  //final AuthService _auth = AuthService(FirebaseAuth.instance);

  createAlertDialog(BuildContext context){
  return showDialog(context: context, builder: (context)
  {
    return AlertDialog(
      title: Text("Payment has been submitted"),
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
          'Make Payment',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const CircleAvatar(
                radius: 52, backgroundImage: AssetImage('assets/jazcash.jpg')),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            jazcash_num=value;
                          },
                          controller: number,
                          keyboardType: TextInputType.phone,
                           decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                              hintText: 'number',
                              fillColor: Colors.white,
                              filled: true,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: "Enter Jazcash Number",
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
                                return 'Please enter jazcash number';
                              }
                              else if(value.length<11||value.length>13)
                              {
                                return "Mobile number must be between 11 to 13  digits";
                              }
                             else if(!RegExp("^[(+92|0|92)][0-9]{10}").hasMatch(value))
                              {
                                return "Mobile number must start with 0, +92 or 92";
                              }
                            
                              return null;
                            },
                        ),
                        const SizedBox(height: 20),
                        
                      ],
                    ), 
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
               //show data
           Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
            
              Text(widget.plans.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
              ),
             ],
          ),
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
            
              Text('Price :  '+widget.plans.price,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
              ),
             ],
          ),
          SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: () async{
                  if (_formKey.currentState!.validate())
                  {

                   // await _auth.signIn(emailField, passwordField);
                   await payment.add({
                      "Phone_Number" : jazcash_num,
                       "Diet Plan" : widget.plans.title,
                       "Amount" : widget.plans.price,
                        'UserId' :FirebaseAuth.instance.currentUser!.uid,
                       
                      }).then((value) {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Notifications()));
                  
                      });
                      createAlertDialog(context);
                }
                },
                color: Colors.deepOrangeAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Text(
                  "Pay",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height : 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: () {
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WeightCompare()));
                },
                color: Colors.deepOrangeAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Text(
                  "Compare Weight",
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
      ),
    );
                
  }
}