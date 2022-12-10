import 'package:flutter/material.dart';

class Dinner3 extends StatefulWidget {
  const Dinner3({Key? key}) : super(key: key);

  @override
  State<Dinner3> createState() => _Dinner3State();
}

class _Dinner3State extends State<Dinner3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
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
              'Dinner',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
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
            const SizedBox(height: 5),
            const Text(
              'Low Carb Healthy Dinner',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Day 1',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            FittedBox(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Day1_Dinner(),
                    Container(
                      width: 110,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight,
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          image: const AssetImage('assets/lunch14.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Day 2',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            FittedBox(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Day2_Dinner(),
                    Container(
                      width: 110,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight,
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          image: const AssetImage('assets/lunch15.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Day 3',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            FittedBox(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Day3_Dinner(),
                    Container(
                      width: 110,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight,
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          image: const AssetImage('assets/lunch16.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Day 4',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            FittedBox(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Day4_Dinner(),
                    Container(
                      width: 110,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight,
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          image: const AssetImage('assets/breakfast9.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Day 5',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            FittedBox(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Day5_Dinner(),
                    Container(
                      width: 110,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight,
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          image: const AssetImage('assets/breakfast10.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Day 6',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            FittedBox(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Day6_Dinner(),
                    Container(
                      width: 110,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight,
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          image: const AssetImage('assets/breakfast12.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Day 7',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            FittedBox(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Day7_Dinner(),
                    Container(
                      width: 110,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight,
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          image: const AssetImage('assets/breakfast13.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Day 1 dinner
  Widget Day1_Dinner() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'fried vegetables ',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 9,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Day 2 dinner
  Widget Day2_Dinner() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'lentils with ',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 9,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            'vegetables cuisine ',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

//Day 3 Dinner
  Widget Day3_Dinner() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'dish eggs with ',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 9,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            'tomatoes ',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  //Day 4 dinner
  Widget Day4_Dinner() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'snack curd with nuts',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 9,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            'and fruits ',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  //Day 5 dinner
  Widget Day5_Dinner() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'omelete with tomato,',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 9,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            'feta cheese onion',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2),
          Text(
            'and arugula',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  //Day 6 Dinner
  Widget Day6_Dinner() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'croissant sandwich with',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 9,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            'avacado,cheese,fresh',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2),
          Text(
            'salad sprinkled and',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2),
          Text(
            'strawberies',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  //Day 7 dinner
  Widget Day7_Dinner() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'flakes with poached',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 9,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            'egg, fried mushrooms',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2),
          Text(
            'and hurbs',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
