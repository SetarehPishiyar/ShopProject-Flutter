import 'dart:ui';
import 'package:project/screens/Signup.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/Produstlist.dart';
import 'package:project/screens/Cart.dart';
import 'package:project/screens/Profile.dart';
import 'package:project/screens/Product.dart';
import 'Login.dart';
import 'User.dart';
import 'package:flutter/painting.dart';

class HomePage extends StatelessWidget {
  List<Product> allProducts;
  List<Product> basketProducts;
  List<User> Users;
  HomePage(List<Product> allProducts,List<Product> basketProducts,  List<User> Users){
    this.allProducts = allProducts;
    this.basketProducts = basketProducts;
    this.Users = Users;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown[50],
        drawer: Drawer(
          child: Container(
            color: Colors.brown[100],
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.brown[800],
                    height: 55,
                    width: 320,
                    child: Center(
                      child: Text(
                        "- CHOCO SHOP -",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Akshar',
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.brown[200],
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Image.asset('images/me.jpg'),
                      ),
                      title: Text("Setareh Pishiyar"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((BuildContext context) =>
                                    Profile(allProducts,basketProducts,Users))));
                      },
                      subtitle: Text("Tap to open your Profile."),
                    ),
                  ),
                  ListTile(
                    title: Text('Login'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) =>
                                  Login())));
                    },
                  ),
                  ListTile(
                    title: Text('SignUp'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) => SignUp(allProducts,basketProducts,Users))));
                    },
                  ),
                  Divider(
                    color: Colors.brown[900],
                  ),
                  Container(
                      color: Colors.brown[200],
                      child: Row(
                        children: [
                          Icon(Icons.category_outlined),
                          Text(
                            "   Categories ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  Divider(
                    color: Colors.brown[900],
                  ),
                  ListTile(
                    title: Text(
                      'Fashion & Clothes',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: Colors.brown[400],
                  ),
                  ListTile(
                    title: Text('Woman'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Men'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Kids'),
                    onTap: () {},
                  ),
                  Divider(
                    color: Colors.brown[400],
                  ),
                  ListTile(
                    title: Text(
                      'Digital Products',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: Colors.brown[400],
                  ),
                  ListTile(
                    title: Text('Mobile phone'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('LapTop'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Camera'),
                    onTap: () {},
                  ),
                  Divider(
                    color: Colors.brown[400],
                  ),
                  ListTile(
                    title: Text(
                      'Books & Stationery',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: Colors.brown[400],
                  ),
                  ListTile(
                    title: Text('Book'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Stationery'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Music'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Handcrafts'),
                    onTap: () {},
                  ),
                  Divider(
                    color: Colors.brown[400],
                  ),
                  ListTile(
                    title: Text(
                      'Sports & Travel',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: Colors.brown[400],
                  ),
                  ListTile(
                    title: Text('Sport Clothes'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Sport Equipments'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Travel & Camping Equipments'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((BuildContext context) =>
                            CartPage(allProducts,basketProducts,Users))));
              },
              icon: Icon(Icons.shopping_cart),
              color: Colors.white70,
            )
          ],
          title: Container(
            decoration: BoxDecoration(
              color: Colors.brown[200],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: TextFormField(
                      cursorColor: Colors.brown[600],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search in Choco Shop',
                        hintStyle: TextStyle(
                            fontFamily: 'Abel',
                            color: Colors.brown[700],
                            fontSize: 18.0),
                        icon: (Icon(
                          Icons.search,
                          color: Colors.brown[700],
                        )),
                      ),
                    )),
                Expanded(
                  flex: 0,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mic, color: Colors.brown[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.brown[800],
        ),
        body: myList(allProducts,basketProducts,Users),
      ),
    );
  }
}
