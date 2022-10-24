import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keto_app/Services/db.dart';
import 'package:keto_app/screens/notifications.dart';
import 'package:keto_app/screens/plans_data.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class MakePayment extends StatefulWidget {
  final Plans plans;
  const MakePayment({Key? key, required this.plans}) : super(key: key);

  @override
  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {

  final _formKey = GlobalKey<FormState>();
  DBservice db=DBservice();
  TextEditingController number=TextEditingController();
  TextEditingController money=TextEditingController();
 CollectionReference payment=FirebaseFirestore.instance.collection("Payment");
  String jazcash_num="";
  String amount="";
  final plans=["diet plan 1", "diet plan 2", "diet plan 3","diet plan 4"];
String? item;

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
      backgroundColor: Colors.green,
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
                              //prefixIcon: Icon(Icons.numbers),
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
                        Container(
                          width: 350,
                          padding: EdgeInsets.symmetric(horizontal : 12, vertical: 4),
                          decoration: BoxDecoration(
                            
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black
                              ),    
                            ),
                        
                          child:   DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                          
                            value: item,
                          hint: const Text("Select Diet Plan"),
                            iconSize: 36,
                            icon: Icon(Icons.arrow_drop_down,
                            color: Colors.black),
                            isExpanded: true,
                             
                            items: plans.map(buildMenuItem).toList(),
                             onChanged:(value) => 
                             setState(() {
                               this.item=value;
                              
                             })
                             
                             
                             ),
                        ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                           amount=value;
                          },
                          controller: money,
                          keyboardType: TextInputType.number,
                           decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                              fillColor: Colors.white,
                              filled: true,
                              //prefixIcon: Icon(Icons.numbers),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: "Enter Amount in PKR",
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
                                    BorderSide(color: Colors.black),
                              ),
                            ),
                            validator: (value) {
                              if (value  == null || value.isEmpty) {
                                return 'Please enter amount';
                              }
                               else if(!RegExp("^[0-9]").hasMatch(value))
                              {
                                return "Amount must be in digits";
                              }
                              
                            },
                           
                        ),
                      ],
                    ), 
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
//show data
          Column(
             children: [
             // Text(plans.price),
             ],
          ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: () async{
                  if (_formKey.currentState!.validate())
                  {
                   await payment.add({
                      "Phone_Number" : jazcash_num,
                       "Diet Plan" : item,
                       "Amount": double.parse(amount),
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
          ],
        ),
      ),
    );
   
  }
 DropdownMenuItem<String> buildMenuItem(String plan)=>
    DropdownMenuItem(value: plan,
    child: Text(
      plan,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    ),
    );
     
 

void sendMoney() {
}
}