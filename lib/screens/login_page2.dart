
import 'package:flutter/material.dart';
import 'package:keto_app/Services/auth.dart';
import 'package:keto_app/screens/admin_screen.dart';
import 'package:keto_app/screens/home_page.dart';
import 'package:keto_app/screens/plan1_breakfast.dart';
import 'package:keto_app/screens/rider_screen.dart';
import 'package:keto_app/screens/signup_page2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:keto_app/screens/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keto_app/shared/loading.dart';

class LoginScreenUser extends StatefulWidget {
  const LoginScreenUser({Key? key}) : super(key: key);

  @override
  State<LoginScreenUser> createState() => _LoginScreenUserState();
}

class _LoginScreenUserState extends State<LoginScreenUser> {
  final AuthService _auth = AuthService(FirebaseAuth.instance);
  final _formKey = GlobalKey<FormState>();
final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  String error="";
  String role="";


  bool loading=false;
  
  var result;
  
/*void initState(){
  super.initState();
   checkRole();
}
void checkRole() async{
 User? user =FirebaseAuth.instance.currentUser;
 final DocumentSnapshot snap=await FirebaseFirestore.instance.collection("User Data").doc(user!.uid).get();
 setState(() {
   role=snap['snap'];
 });*/
 /*if(role=="user")
 {
  await _auth.signIn(emailField.text, passwordField.text).then((User? user) => 
                 Navigator.push(context,MaterialPageRoute(
                  builder: (context) => DietPlans())),
                 ).onError((error, stackTrace) {
                 print("Error ${error.toString()}");
                 ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('User does not exist for that email'),
                  duration: const Duration(seconds: 3),
                  ),
                 
                );
                
                       } );
 }
 else if(role=="Admin")
 {
  await _auth.signIn(emailField.text, passwordField.text).then((User? user) => 
                 Navigator.push(context,MaterialPageRoute(
                  builder: (context) => Breakfast1())),
                 ).onError((error, stackTrace) {
                 print("Error ${error.toString()}");
                 ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('User does not exist for that email'),
                  duration: const Duration(seconds: 3),
                  ),
                 
                );
                
                       } );
 }*/
//}
  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepOrangeAccent,
     
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal:40),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children:const  <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Login to Your Account",
                        style: TextStyle(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Form(  
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 20.0),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: emailField,
                            
                            decoration: const InputDecoration(
                             
                              contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                              // icon: Icon(Icons.email),
                              hintText: 'something@email.com',
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.email),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: "Email",
                              labelStyle:  TextStyle(
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                               focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepOrange),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              }
                              if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                                   return 'Please enter a valid Email';
                              }
                              return null;
                            },
                          
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                          
                            obscureText: true,
                            
                           controller: passwordField,
                            decoration: const InputDecoration(
                             contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                              hintText: 'password',
                              fillColor: Colors.white,
                              filled:true,
                              prefixIcon: Icon(Icons.lock),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                                enabledBorder: OutlineInputBorder(  
                                borderSide: BorderSide(
                                  color: Colors.white,
                                )
                              ),
                               focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepOrange),
                              ),
                            ),
                            validator: (value){
                               if (value==null|| value.length<6) {
                                return 'Please enter 6+ characters long password ';
                              }
                              return null;
                            }      
                          ),
                        ], 
                      ),
                      ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                         setState(() {
                           loading=true;
                         });
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
                  
                  if(emailField.text=="kashafu719@gmail.com")
                    {
                dynamic result= await _auth.signIn(emailField.text, passwordField.text).then((User? user) => 
                 Navigator.push(context,MaterialPageRoute(
                  builder: (context) => AdminScreen())),
                 ).onError((error, stackTrace) {
                 print("Error ${error.toString()}");
                 ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('User does not exist for that email'),
                  duration: const Duration(seconds: 3),
                  ),
                 
                );
                       } );
                    }
                    else if(emailField.text=="asad@gmail.com")
                    {
                      dynamic result= await _auth.signIn(emailField.text, passwordField.text).then((User? user) => 
                 Navigator.push(context,MaterialPageRoute(
                  builder: (context) =>RiderScreen())),
                 ).onError((error, stackTrace) {
                 print("Error ${error.toString()}");
                 ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('User does not exist for that email'),
                  duration: const Duration(seconds: 3),
                  ),
                 
                );  
                
                       } );
                    }

                    else if(emailField.text=="umer@gmail.com")
                    {
                      dynamic result= await _auth.signIn(emailField.text, passwordField.text).then((User? user) => 
                 Navigator.push(context,MaterialPageRoute(
                  builder: (context) =>RiderScreen())),
                 ).onError((error, stackTrace) {
                 print("Error ${error.toString()}");
                 ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('User does not exist for that email'),
                  duration: const Duration(seconds: 3),
                  ),
                 
                );
                
                       } );
                    }
                    else 
                    {
                   dynamic result= await _auth.signIn(emailField.text, passwordField.text).then((User? user) => 
                 Navigator.push(context,MaterialPageRoute(
                  builder: (context) =>DietPlans())),
                 ).onError((error, stackTrace) {
                 print("Error ${error.toString()}");
                 ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('User does not exist for that email'),
                  duration: const Duration(seconds: 3),
                  ),
                 
                );
                
                       } );
                    }
                 
                      }
                
                if(result==null)
                {
                  setState(() {
                    error='could not sign in with those credentials';
                    loading=false;
                  });
                }
                        },
                      
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Don't have an account ? ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreenUser()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrangeAccent,
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//signIn(String text, String text2) {}

//we will be craeting  a widget for text field
Widget InputFile({label, obscuretext = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(height: 5),
      TextField(
        obscureText: obscuretext,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}
