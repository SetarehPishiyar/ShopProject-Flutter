import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project/screens/homepage.dart';
import 'package:flutter/painting.dart';

import 'Product.dart';
import 'User.dart';



class Profile extends StatelessWidget {
  List<Product> allProducts;
  List<Product> basketProducts;
  List<User> Users;
  Profile(List<Product> allProducts,List<Product> basketProducts,  List<User> Users){
    this.allProducts = allProducts;
    this.basketProducts = basketProducts;
    this.Users = Users;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown[200],
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('images/me.jpg'),
                ),
                SizedBox(
                  width: 150.0,
                  height: 20.0,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.brown[50],
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: TextFormField(
                              cursorColor: Colors.brown[700],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Setareh Pishiyar',
                                hintStyle: TextStyle(
                                    fontFamily: 'Akshar',
                                    color: Colors.brown[700],
                                    fontSize: 18.0),
                                icon: (Icon(
                                  Icons.person,
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
                                icon:
                                    Icon(Icons.edit, color: Colors.brown[700]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.brown[50],
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
                                hintText: '+98 901 591 5898',
                                hintStyle: TextStyle(
                                    fontFamily: 'Akshar',
                                    color: Colors.brown[700],
                                    fontSize: 18.0),
                                icon: (Icon(
                                  Icons.phone,
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
                                icon:
                                    Icon(Icons.edit, color: Colors.brown[700]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.brown[50],
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: TextFormField(
                              cursorColor: Colors.brown[700],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'PishiyarSetareh@gmail.com',
                                hintStyle: TextStyle(
                                    fontFamily: 'Akshar',
                                    color: Colors.brown[700],
                                    fontSize: 18.0),
                                icon: (Icon(
                                  Icons.email_outlined,
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
                                icon:
                                    Icon(Icons.edit, color: Colors.brown[700]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 150.0,
                  height: 20.0,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: ButtonTheme(
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.brown[400],
                            child: Text(
                              "Update Profile",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          height: 40,
                          minWidth: 150,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: ButtonTheme(
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((BuildContext context) =>
                                          HomePage(allProducts,basketProducts,Users))));
                            },
                            color: Colors.brown[400],
                            child: Text(
                              "Back",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          height: 40,
                          minWidth: 150,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
