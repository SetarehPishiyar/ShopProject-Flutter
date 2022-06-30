import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project/screens/Product.dart';
import 'package:project/screens/ProductScreen.dart';
import 'package:flutter/painting.dart';

import 'User.dart';
import 'homepage.dart';

class CartPage extends StatelessWidget {
  List<Product> allProducts;
  List<Product> basketProducts;
  List<User> Users;
  int toPay = 0;
  CartPage(List<Product> allProducts,List<Product> basketProducts,  List<User> Users){
    this.allProducts = allProducts;
    this.basketProducts = basketProducts;
    this.Users = Users;
    for(int i=0; i<basketProducts.length;i++){
      toPay+=basketProducts[i].price;
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[500],
          centerTitle: true,
          title: Text(
            "- Your Basket - ",
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
                  itemCount: basketProducts.length,
                  scrollDirection: Axis.vertical,
                ),
                height: 600,
              ),
              Divider(
                height: 50,
              ),
              Row(
                children: [
                  Text("       "),
                  Icon(
                    Icons.payment,
                    color: Colors.brown[500],
                    size: 25,
                  ),
                  Container(
                    padding:
                    const EdgeInsets.only(right: 20,left: 5),
                    child: Text("  SUM : "+toPay.toString()+" Tomans",style: TextStyle(fontFamily: 'Akshar',fontSize: 19),),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.brown[400]),
                    child: const Text(
                      'Pay',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: (){}
                  ),
                ],
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
                basketProducts[index].imageURL,
                fit: BoxFit.fitWidth,
                height: 230,
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
                basketProducts[index].title.toString(),
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
                " " + basketProducts[index].price.toString() + " Tomans",
                style: TextStyle(
                    color: Colors.green, fontFamily: 'Akshar', fontSize: 13),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.black,
                ),
                onPressed: () {
                  basketProducts.remove(basketProducts[index]);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((BuildContext context) => CartPage(allProducts, basketProducts, Users))));
                },
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "    Seller : " + basketProducts[index].seller,
                style: TextStyle(
                    fontFamily: 'Akshar', fontSize: 13, color: Colors.black),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
