
import 'dart:ui';
import 'package:project/screens/Product.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/homepage.dart';
import 'package:project/screens/Cart.dart';
import 'package:flutter/painting.dart';
import 'User.dart';

class ProductScreen extends StatefulWidget {
  List<Product> basketProducts;
  List<User> Users;
  List<Product> allProducts;
  String inputValue = "";
  int productID;
  String title;
  int price;
  String imageURL;
  String seller;
  String description;
  List<String> gallery;
  String category;
  String subCategory;
  List<String> colors;
  List<String> sizes;
  double Rate;
  List<String> Comments;
  int Count;

  ProductScreen(

      List<User> Users,
      List<Product> allProducts,
      List<Product> basketProducts,
      String title,
      int price,
      String imageURL,
      String seller,
      String description,
      String category,
      String subCategory,
      List<String> colors,
      List<String> sizes,
      double Rate,
      List<String> comments,
      int count) {
    this.allProducts = allProducts;
    this.basketProducts = basketProducts;
    this.Users = Users;
    this.title = title;
    this.price = price;
    this.imageURL = imageURL;
    this.seller = seller;
    this.description = description;
    this.category = category;
    this.subCategory = subCategory;
    this.colors = colors;
    this.colors = sizes;
    this.Rate = Rate;
    this.Comments = comments;
    this.Count = count;
  }

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
                backgroundColor: Colors.brown[100],
                appBar: AppBar(
                  toolbarHeight: 35,
                  bottom: TabBar(
                    indicatorColor: Colors.brown[300],
                    tabs: <Widget>[
                      Tab(
                        text: "View",
                        icon: Icon(
                          Icons.view_agenda,
                          color: Colors.brown[200],
                          size: 17,
                        ),
                      ),
                      Tab(
                        text: "Description",
                        icon: Icon(
                          Icons.title,
                          color: Colors.brown[200],
                          size: 17,
                        ),
                      ),
                      Tab(
                        text: "Comments",
                        icon: Icon(
                          Icons.comment,
                          color: Colors.brown[200],
                          size: 17,
                        ),
                      ),
                      Tab(
                        text: "Gallery",
                        icon: Icon(
                          Icons.image,
                          color: Colors.brown[200],
                          size: 17,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_return_outlined,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((BuildContext context) =>
                                    HomePage(widget.allProducts,widget.basketProducts,widget.Users))));
                      },
                    )
                  ],
                  centerTitle: true,
                  title: Text(
                    "- CHOCO SHOP - ",
                    style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Akshar',
                        fontSize: 23),
                  ),
                  backgroundColor: Colors.brown[700],
                ),
                body: TabBarView(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.all(20.0),
                              width: 400,
                              height: 500,
                              decoration: BoxDecoration(
                                color: Colors.brown[50],
                                border:
                                    Border.all(color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    widget.imageURL,
                                    height: 320,
                                  ),
                                  Text(
                                    widget.title.toString(),
                                    style: TextStyle(
                                      fontFamily: "Akshar",
                                      fontSize: 18,
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.brown[700],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.bookmark_border,
                                        ),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.comment_outlined),
                                        onPressed: () {},
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "  - Price : ",
                                            style: TextStyle(
                                                fontFamily: "Akshar",
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            widget.price.toString() + " Tomans",
                                            style: TextStyle(
                                                fontFamily: "Akshar",
                                                color: Colors.green,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "           Rate :  Count : ",
                                            style: TextStyle(
                                                fontFamily: "Akshar",
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("  "),
                                      Icon(Icons.color_lens_outlined),
                                      Text(
                                        "Colors",
                                        style: TextStyle(fontFamily: 'Akshar'),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FlatButton(
                                      color: Colors.green,
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.add_shopping_cart,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              "Add to Cart",
                                              style: TextStyle(
                                                  fontFamily: 'Akshar',
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                      onPressed: () {
                                        widget.basketProducts.add(new Product(widget.title, widget.price, widget.Count, widget.description, widget.seller, widget.colors, widget.sizes, widget.category, widget.subCategory, widget.imageURL));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    ((BuildContext context) =>
                                                        CartPage(widget.allProducts,widget.basketProducts,widget.Users))));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                        color: Colors.brown[100],
                        border: Border.all(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      height: 450,
                      width: 600,
                      child: Column(
                        children: [
                          Text(
                            "\n - Product Description : \n",
                            style: TextStyle(
                                fontFamily: 'Akshar',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 3.0,
                          ),
                          Row(
                            children: [
                              Text(
                                widget.description,
                                style: TextStyle(fontFamily: 'Akshar'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "\n People say : ",
                                        style: TextStyle(
                                            fontFamily: 'Akshar',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      height: 85,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.brown[50],
                                      ),
                                      child: Text(
                                        " Setareh : \n Wow! This is Beautiful.\n\n Submitted on : " +
                                            DateTime.now().toString(),
                                        style: TextStyle(fontFamily: 'Akshar'),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      height: 85,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.brown[50],
                                      ),
                                      child: Text(
                                        " Ali : \n I bought one. That's Cool.\n\n Submitted on : " +
                                            DateTime.now().toString(),
                                        style: TextStyle(fontFamily: 'Akshar'),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      height: 85,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.brown[50],
                                      ),
                                      child: Text(
                                        " Amir : \n Nice Colors.\n\n Submitted on : " +
                                            DateTime.now().toString(),
                                        style: TextStyle(fontFamily: 'Akshar'),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      height: 85,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.brown[50],
                                      ),
                                      child: Text(
                                        " Zahra : \n I Don't Like it.\n\n Submitted on : " +
                                            DateTime.now().toString(),
                                        style: TextStyle(fontFamily: 'Akshar'),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      height: 85,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.brown[50],
                                      ),
                                      child: Text(
                                        " Sepid : \n Too Expensive.\n\n Submitted on : " +
                                            DateTime.now().toString(),
                                        style: TextStyle(fontFamily: 'Akshar'),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      cursorColor: Colors.black,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Your Name';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.brown[900],
                                        ),
                                        labelText: "Your name",
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.brown[900],
                                        ),
                                        labelText: "Your Email",
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      minLines: 5,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.comment,
                                          color: Colors.brown[900],
                                        ),
                                        labelText: "Your Comment",
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                      ),
                                    ),
                                  ),
                                  ButtonTheme(
                                    child: RaisedButton(
                                      onPressed: () {},
                                      color: Colors.brown[300],
                                      child: Text(
                                        "Submit Comment",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    height: 50,
                                    minWidth: MediaQuery.of(context).size.width,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Container()
                  ],
                )),
          ),
        ));
  }
}
