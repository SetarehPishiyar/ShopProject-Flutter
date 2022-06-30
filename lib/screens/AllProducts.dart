import 'dart:ui';
import 'package:project/screens/Product.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/Produstlist.dart';
import 'package:project/screens/ProductScreen.dart';
import 'package:flutter/painting.dart';

import 'User.dart';
import 'homepage.dart';

class AllProducts extends StatelessWidget {
  List<Product> allProducts;
  List<Product> basketProducts;
  List<User> Users;
  AllProducts(List<Product> allProducts,List<Product> basketProducts,  List<User> Users){
    this.allProducts = allProducts;
    this.basketProducts = basketProducts;
    this.Users = Users;
  }

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        Scaffold(
            backgroundColor: Colors.brown[50],
            appBar: AppBar(
              backgroundColor: Colors.brown[500],
              centerTitle: true,
              title: Text(
                "- All Products - ",
                style: TextStyle(fontFamily: 'Akshar', color: Colors.black),
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
                                HomePage(allProducts,basketProducts,Users))));
                  },
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: ListView.builder(
                      itemBuilder: listRow,
                      itemCount: allProducts.length,
                      scrollDirection: Axis.vertical,
                    ),
                    height: 730,
                  ),
                ],
              ),
            ),
          ),
        );
  }

  Widget listRow(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Center(
              child: Image.asset(
                allProducts[index].imageURL,
                fit: BoxFit.fitWidth,
                height: 210,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((BuildContext context) => ProductScreen(
                          Users,
                          allProducts,
                          basketProducts,
                          allProducts[index].title,
                          allProducts[index].price,
                          allProducts[index].imageURL,
                          allProducts[index].seller,
                          allProducts[index].description,
                          allProducts[index].category,
                          allProducts[index].subCategory,
                          allProducts[index].colors,
                          allProducts[index].sizes,
                          allProducts[index].Rate,
                          allProducts[index].Comments,
                          allProducts[index].Count))));
            },
          ),
          GestureDetector(
            child: Center(
              child: Text(
                allProducts[index].title.toString(),
                style: TextStyle(
                  fontSize: 13.0,
                  fontFamily: 'Akshar',
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((BuildContext context) => ProductScreen(
                        Users,
                          allProducts,
                          basketProducts,
                          allProducts[index].title,
                          allProducts[index].price,
                          allProducts[index].imageURL,
                          allProducts[index].seller,
                          allProducts[index].description,
                          allProducts[index].category,
                          allProducts[index].subCategory,
                          allProducts[index].colors,
                          allProducts[index].sizes,
                          allProducts[index].Rate,
                          allProducts[index].Comments,
                          allProducts[index].Count))));
            },
          ),
          Divider(color: Colors.black),
          Row(
            children: [
              Text("  "),
              Icon(
                Icons.monetization_on_outlined,
                color: Colors.black,
                size: 15,
              ),
              Text(
                " " + allProducts[index].price.toString() + " Tomans",
                style: TextStyle(
                    color: Colors.green, fontFamily: 'Akshar', fontSize: 13),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "    Seller : " + allProducts[index].seller,
                style: TextStyle(
                    fontFamily: 'Akshar', fontSize: 13, color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
