

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:keto_app/Services/auth.dart';
import 'package:keto_app/screens/alert_dialog_logout.dart';
import 'package:keto_app/screens/authenticate/authenticate.dart';
import 'package:keto_app/screens/dietplan1_Menu.dart';
import 'package:keto_app/screens/dietplan2_Menu.dart';
import 'package:keto_app/screens/dietplan3_Menu.dart';
import 'package:keto_app/screens/dietplan4_Menu.dart';
import 'package:keto_app/screens/login_page2.dart';
import 'package:keto_app/screens/payment_method.dart';
import 'package:provider/provider.dart';
import '../models/user_data.dart';
import 'package:keto_app/screens/plans_data.dart';

class DietPlans extends StatefulWidget {

  DietPlans({Key?  key}) : super(key: key);

  @override
  State<DietPlans> createState() => _DietPlansState();
}

 class _DietPlansState extends State<DietPlans> {
 int selectedIndex=-1;
 int _value=-1;
double rating=0.0;
bool selectedList=false;
final String title = '';

  final AuthService _auth = AuthService(FirebaseAuth.instance);
  
static List<String> plan_title=["Diet Plan 1", "Diet Plan 2", "Diet Plan 3", "Diet Plan 4", "Diet Plan 5", "Diet Plan 6", "Diet Plan 7", "Diet Plan 8", "Diet Plan 9", "Diet plan 10"];
static List<String> plan_desc=["30 days diet plan", "30 days diet plan", "60 days diet plan", "60 days diet plan","45 days diet plan", "45 days diet plan", "60 days diet plan","60 days diet plan","30 days diet plan","45 days diet plan"];

static List<String> plan_price=["40000 PKR","45000 PKR","60000 PKR","70000 PKR","50000 PKR","55000 PKR","75000 PKR","65000 PKR","80000 PKR","58000 PKR"];
static List image_url=["assets/ketofood6.jpg", "assets/ketofood7.jpg", "assets/lunch13.jpg", "assets/ketofood4.jpg","assets/breakfast14.jpg","assets/P2.jpg","assets/P3.jpg","assets/lunch3.jpg","assets/breakfast13.jpg","assets/lunch15.jpg"];
final List<Plans> diet_data=List.generate(plan_title.length, (index) => Plans(title: '${plan_title[index]}', desc: '${plan_desc[index]}', price: '${plan_price[index]}', image: '${image_url[index]}'));

  //Dialog Box
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.restaurant_menu,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            const Text(
              'Keto Diet Plans',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(width: 20),
             ElevatedButton.icon(
              icon: const Icon(Icons.person,
              color: Colors.black,
              ),
              label: const Text('Logout',
              style: TextStyle(
                color: Colors.black
              ),
              
              ),
              onPressed: () async {
                final action=await AlertDialogs.yesCancelDialog(context, 'Logout', 'Are you sure you want to logout?');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent,
              ),
              
            ),
         
          ],
        ),
      ),
      body: Padding(
        
        padding: const EdgeInsets.symmetric(horizontal: 5),

    child: 
   // ListView(
    ListView.builder(   
    scrollDirection: Axis.vertical,
   // children: <Widget>[
     // ListView(
     
    itemCount: 10,
    itemBuilder: ( context,  index) {
    
    // InkWell(
               // onTap: () => setState(() => selectedIndex=position),
     
    // );
          return  Card(
   
            child:     ListTile(
                
                title: Text(diet_data[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                
                ),
                subtitle:
                // Text(diet_data[index].desc),
                RichText(
                  text: TextSpan(
                text: '${diet_data[index].desc}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
              recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      if(diet_data[index].title=='Diet Plan 1')
                      {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DietMenu1()));
                      }
                              else if(diet_data[index].title=='Diet Plan 2')
                              {
                                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DietMenu2()));
                              }
                              else if(diet_data[index].title=='Diet Plan 3')
                              {
                                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DietMenu3()));
                              }
                              else if(diet_data[index].title=='Diet Plan 4')
                              {
                                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DietMenu4()));
                              }
                              else if(diet_data[index].title=='Diet Plan 5')
                              {
                                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DietMenu1()));
                              }
                              else if(diet_data[index].title=='Diet Plan 6')
                              {
                                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DietMenu2()));
                              }
                              else if(diet_data[index].title=='Diet Plan 7')
                              {
                                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DietMenu3()));
                              }
                              else if(diet_data[index].title=='Diet Plan 8')
                              {
                                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DietMenu4()));
                              }
                              else if(diet_data[index].title=='Diet Plan 9')
                              {
                                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DietMenu1()));
                              }
                              else if(diet_data[index].title=='Diet Plan 10')
                              {
                                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DietMenu2()));
                              }
                    }
                    
              )
            ),
                  
                trailing: Text(diet_data[index].price),
                leading: SizedBox(
                width: 50,
                height: 100,
                child: Image.asset(diet_data[index].image,
                fit: BoxFit.cover,),
                ),
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  PaymentScreen(plans: diet_data[index],)));
                },
               
              ),
            
            elevation: 5,
             margin: EdgeInsets.all(8),
          );
          
          
          /*Hero(
          tag: 'item_keto',
          child: FittedBox(
                     
             child: Card(
              
                 // color: (selectedIndex==position)  ? 
                 //Colors.lightBlueAccent
                 color: Colors.white,
                 //shape:  RoundedRectangleBorder (
                  // borderRadius: BorderRadius.circular(15.0),
         //s  ),
              // : null,              
                 elevation: 5,
                 child:  Row(
                    children: <Widget>[
                      Item1_Keto(),                  
                      Container(
                        width: 90,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: const Image(
                            fit: BoxFit.cover,
                            alignment: Alignment.topRight,
                            image: AssetImage('assets/ketofood6.jpg'),
                          ),
                          
                        ),  
                      ), 
                    ],
                  ),
                ), 
         ),
    ); */
        
        /*  Hero(
          tag: 'item2_keto',
          child: FittedBox(
              child: Card(
                color: Colors.white,             
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Item2_Keto(),
                    Container(
                      width: 90,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const Image(
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight,
                          image: AssetImage('assets/ketofood7.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        
       Hero(
        tag: 'item3_keto',
        child: FittedBox(
            child: Card(
              color: Colors.white,
              //shape: RoundedRectangleBorder(
              //  borderRadius: BorderRadius.circular(15.0),
              //),
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Item3_Keto(),
                  Container(
                    width: 90,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: const Image(
                        fit: BoxFit.cover,
                        alignment: Alignment.topRight,
                        image: AssetImage('assets/lunch13.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
       
      
       Hero(
        tag: 'item4_keto',
        child: FittedBox(
            child: Card(
              color: Colors.white,
              //shape: RoundedRectangleBorder(
               // borderRadius: BorderRadius.circular(15.0),
              //),
              elevation: 5,
              child: Row(
                children: <Widget>[
                  Item4_Keto(),
                  Container(
                    width: 90,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: const Image(
                        fit: BoxFit.cover,
                        alignment: Alignment.topRight,
                        image: AssetImage('assets/ketofood4.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
            
          
         Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MakePayment(price1: null,)));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrangeAccent,
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
         
        ],
      ),*/
  
    }
      ),
    
      ),
      
    );
  }

  //item 1
 /* Widget Item1_Keto() {
    var index;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // ignore: unnecessary_const
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: RichText(
              text: TextSpan(
                text: '${diet_data[index].title}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
              recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DietMenu1()));
                    }
                    
              )
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '30 days diet plan',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
            Text(
            "price: ${price1}",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Rating: $rating",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 9,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 17,
              itemBuilder: (context,_)=> 
              
                   Icon(
                Icons.star,
                //size: 5,
                color: Colors.orangeAccent,
              ),
                updateOnDrag: true,
            onRatingUpdate: (rating)=>
              setState((){
                 this.rating=rating;
              }),
                
              ),
            ],
          ),
        ],
      ),
    );
  }*/

//Item 2
 /* Widget Item2_Keto() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: RichText(
              text: TextSpan(
                text: 'Diet Plan 2',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
              recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DietMenu2()));
                    }
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '30 days diet plan',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
           const Text(
            'Price: 45000 PKR',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  <Widget>[
              Text(
                "Rating: $rating",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 9,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 17,
              itemBuilder: (context,_)=> 
              
                   Icon(
                Icons.star,
                //size: 5,
                color: Colors.orangeAccent,
              ),
                updateOnDrag: true,
            onRatingUpdate: (rating)=>
              setState((){
                 this.rating=rating;
              }),
                
              ),
            ],
          ),
        ],
      ),
    );
  }

  //item 3
  Widget Item3_Keto() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: RichText(
              text: TextSpan(
                text: 'Diet Plan 3',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
              recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DietMenu3()));
                    }
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '60 days diet plan',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
           const Text(
            'Price: 60000 PKR',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  <Widget>[
              Text(
                "Rating: $rating",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 9,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 17,
              itemBuilder: (context,_)=> 
              
                   Icon(
                Icons.star,
                //size: 5,
                color: Colors.orangeAccent,
              ),
                updateOnDrag: true,
            onRatingUpdate: (rating)=>
              setState((){
                 this.rating=rating;
              }),
                
              ),
            ],
          ),
        ],
      ),
    );
  }

//item 4
  Widget Item4_Keto() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: RichText(
              text: TextSpan(
              text: 'Diet Plan 4',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
              recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DietMenu4()));
                    }
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '60 days diet plan',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
           const Text(
            'Price: 70000 PKR',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Rating: $rating",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 9,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5),
               RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 17,
              itemBuilder: (context,_)=> 
              
                   Icon(
                Icons.star,
                //size: 5,
                color: Colors.orangeAccent,
              ),
                updateOnDrag: true,
            onRatingUpdate: (rating)=>
              setState((){
                 this.rating=rating;
              }),
                
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildView(BuildContext context) {
    List userDataList = Provider.of<List<UserData>>(context);
    return Container(
      width: double.maxFinite,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: userDataList.length,
        itemBuilder: (_, int index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: ListTile(
            title: Text(
              userDataList[index].email,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            subtitle: Text(
              userDataList[index].weight,
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
        ),
      ),
    );
  }*/

 
}
