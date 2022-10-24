import 'package:keto_app/Services/db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keto_app/screens/home_page.dart';
import 'package:keto_app/screens/login_page2.dart';
import 'package:keto_app/Services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:keto_app/screens/plan1_breakfast.dart';
import 'package:keto_app/screens/plan1_dinner.dart';
import 'package:keto_app/screens/viewuserpage.dart';
import 'package:keto_app/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:keto_app/models/user.dart' as UserModal;

//import '../Services/db.dart';

class SignUpScreenUser extends StatefulWidget {
  SignUpScreenUser({Key? key}) : super(key: key);

  @override
  State<SignUpScreenUser> createState() => _SignUpScreenUserState();
}

class _SignUpScreenUserState extends State<SignUpScreenUser> {
  bool navigateToPage=false;
  int _value = 1;
  final DBservice uid = DBservice();
  final AuthService _auth = AuthService(FirebaseAuth.instance);
  final _formKey = GlobalKey<FormState>();
  TextEditingController Username = TextEditingController();
 // OneSignalService one=OneSignalService();
//String Username="";
  TextEditingController passwordField = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController address = TextEditingController();

  bool loading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.green,
           
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                   
                    Column(
                      children: const <Widget>[
                        Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Create a new account!",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 2),
                        Radio(
                            value: 1,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value as int;
                                
                              });
                              
                            }),
                        const SizedBox(height: 8),
                        const Text(
                          'User',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Radio(
                            value: 2,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value as int;
                              });
                            }),
                        const SizedBox(height: 15),
                        const Text(
                          'Rider',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 15.0),
                          TextFormField(
                            controller: Username,
                      
                            // onChanged: (value) => Username.text=value.toString(),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                              hintText: 'username',
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.person),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: "Username",
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
                                return 'Please enter username';
                              }
                              else if(value.length<3)
                              {
                                return "Username must be more than 2 characters";
                              }
                              else if(!RegExp("^[a-zA-Z]").hasMatch(value))
                              {
                              return 'Please enter username between a-z or A-Z';
                              }
                              return null;
                            },
                          ),
                          // Text(Username.toString()),

                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: height,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: 'height in feet or inches',
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.height),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: "Height",
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
                            // onChanged: (value) => height.text=value.toString(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter height';
                              }
                              else if(!RegExp("^[0-9]").hasMatch(value))
                              {
                              return 'Please enter valid height in numbers';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: weight,
                            //  onChanged: (value) => weight.text=value.toString(),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: 'weight in kg',
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.line_weight_rounded),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: "Weight",
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
                              else if(!RegExp("^[0-9]").hasMatch(value))
                              {
                              return 'Please enter valid weight in Kgs';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: emailField,
                            keyboardType: TextInputType.emailAddress,
                            // onChanged: (value) => emailField.text=value.toString(),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: 'something@email.com',
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.email),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: "Email",
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
                                return 'Please enter email';
                              }
                              else if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return 'Please enter a valid Email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: address,
                            //  onChanged: (value) => address.text=value.toString(),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: 'address',
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.location_pin),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              labelText: "Address",
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
                                return 'Please enter address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            obscureText: true,
                            controller: passwordField,
                            //  onChanged: (value) => passwordField.text=value.toString(),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: 'password',
                              fillColor: Colors.white,
                              filled: true,
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
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepOrange),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.length < 6) {
                                return 'Please enter 6+ characters long passowrd';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //
                            //const SnackBar(content: Text('Processing Data')),
                            //  );
                            //  final String uid='';

                           final keto_collection = FirebaseFirestore.instance
                                .collection('User Data');
                                if(_value==1){
                                
                            dynamic result = await _auth
                                .register(emailField.text, passwordField.text,
                                height.text, weight.text, address.text) 
                                .then((User? user) => 
                                
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                   builder: (context) => DietPlans()))).onError((error, stackTrace) {
                                        
                                        print("Error ${error.toString()}");
                                         ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                  content: Text('This email already exists'),
                               // duration: const Duration(seconds: 3),
                                   ),
                 
                                     );
                                   } );
                                
                                
                               if (result == null) {
                              setState(() {
                                error = 'please provide a valid email';
                                loading = false;
                              });
                            }
                                }

                                //Rider
                         else  if(_value==2){
                            dynamic result = await _auth
                                .register(emailField.text,passwordField.text,
                                height.text, weight.text, address.text)
                                .whenComplete(() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Breakfast1())));
                                     

                            if (result == null) {
                              setState(() {
                                error = 'please provide a valid email';
                                loading = false;
                              });
                            }
                                }

                                }
                          // await context.read<AuthService>().Register(emailField.text,passwordField.text);
                         
                        },
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Already have an account ? ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreenUser()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: const Text(
                              "Login",
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
            ),
          );
  }
}
