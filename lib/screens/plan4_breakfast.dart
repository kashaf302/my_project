import 'package:flutter/material.dart';

class Breakfast4 extends StatefulWidget {
  const Breakfast4({Key? key}) : super(key: key);

  @override
  State<Breakfast4> createState() => _Breakfast4State();
}

class _Breakfast4State extends State<Breakfast4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
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
              'Breakfast',
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
              'Low Carb Breakfast',
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
                    Day1_breakfast(),
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
                          image: const AssetImage('assets/breakfast6.jpg'),
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
                    Day2_breakfast(),
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
                          image: const AssetImage('assets/breakfast7.jpg'),
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
                    Day3_breakfast(),
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
                          image: const AssetImage('assets/breakfast8.jpg'),
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
                    Day4_breakfast(),
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
                    Day5_breakfast(),
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
                    Day6_breakfast(),
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
                    Day7_breakfast(),
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

  //Day 1 Breakfast
  Widget Day1_breakfast() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'eggs,tomatoes,salad',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 9,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            'leaves and bacon',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  //Day 2 Breakfast
  Widget Day2_breakfast() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'boiled egg,avocado,',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 9,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            'cheese,salad leaves',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

//Day 3 breakfast
  Widget Day3_breakfast() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'boiled egg, grilled',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 9,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            'chicken,strawberies,fresh',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2),
          Text(
            'salad and avacado',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  //Day 4 breakfast
  Widget Day4_breakfast() {
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

  //Day 5 breakfast
  Widget Day5_breakfast() {
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

  //Day 6 breakfast
  Widget Day6_breakfast() {
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

  //Day 7 breakfast
  Widget Day7_breakfast() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  <Widget>[
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
