import 'package:flutter/material.dart';
import 'package:keto_app/screens/plan4_breakfast.dart';
import 'package:keto_app/screens/plan4_dinner.dart';
import 'package:keto_app/screens/plan4_lunch.dart';

class DietMenu4 extends StatefulWidget {
  const DietMenu4({Key? key}) : super(key: key);

  @override
  State<DietMenu4> createState() => _DietMenu4State();
}

class _DietMenu4State extends State<DietMenu4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        //centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        // automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.restaurant_menu,
              color: Colors.black,
            ),
            SizedBox(width: 10),
            Text(
              'Menu',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Hero(
              tag: 'breakfast',
              child: FittedBox(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Breakfast4()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        breakfast(),
                        SizedBox(
                          width: 90,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: const Image(
                              fit: BoxFit.cover,
                              alignment: Alignment.topRight,
                              image: AssetImage('assets/breakfast14.jpg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Hero(
              tag: 'lunch',
              child: FittedBox(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Lunch4()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        lunch(),
                        SizedBox(
                          width: 90,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: const Image(
                              fit: BoxFit.cover,
                              alignment: Alignment.topRight,
                              image: AssetImage('assets/P5.jpg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Hero(
              tag: 'dinner',
              child: FittedBox(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dinner4()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        dinner(),
                        Container(
                          width: 90,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: const Image(
                              fit: BoxFit.cover,
                              alignment: Alignment.topRight,
                              image: AssetImage('assets/P6.jpg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Breakfast
  Widget breakfast() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'Breakfast',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

//Lunch
  Widget lunch() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'Lunch',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  //dinner
  Widget dinner() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'Dinner',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
