import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project/screens/AddProduct.dart';
import 'package:project/screens/Product.dart';
import 'package:project/screens/ProductScreen.dart';
import 'package:project/screens/AllProducts.dart';
import 'package:flutter/painting.dart';

import 'User.dart';

class myList extends StatelessWidget {
  List<Product> allProducts;
  List<Product> basketProducts;
  List<User> Users;

  myList(List<Product> allProducts, List<Product> basketProducts,
      List<User> Users) {
    this.allProducts = allProducts;
    this.basketProducts = basketProducts;
    this.Users = Users;
  }

  List<Widget> Slider = [];

  @override
  Widget build(BuildContext context) {
    Slider.add(Container(
      child: Image.asset(
        "images/choco.jpg",
        fit: BoxFit.fill,
      ),
    ));
    // Product p1 = new Product(
    //   title: "sleeveless dress",
    //   imageURL: "images/Eddie1.jpg",
    //   price: 10000,
    //   seller: "Eddie",
    //   ID: 1,
    //   description:
    //       "  Material:\n  Cotton 100%\n  Care Info: Cold Wash\n  Colors:\n  "
    //       "Dark Blue - Light Blue\n  "
    //       "Sizes:\n  Free\n\n  SELLER : Eddie",
    // );
    //
    // allProducts.add(p1);
    // Product p2 = new Product(
    //     title: "Vneck Blouse",
    //     imageURL: "images/woman1.jpg",
    //     price: 20000,
    //     seller: "Wish",
    //     ID: 2,
    //     description:
    //         "  Material:\n  Polyester 100%\n  Care Info: Dry Clean, Hand Wash\n  Colors:\n  "
    //         "Cream - Sky Blue - Pink\n  "
    //         "Sizes:\n  Free - L \n\n  SELLER : Wish");
    //
    // allProducts.add(p2);
    //
    // Product p3 = new Product(
    //     title: "Basic Tshirt",
    //     imageURL: "images/Justone1.jpg",
    //     price: 15000,
    //     seller: "Justone",
    //     ID: 3,
    //     description:
    //         "  Material:\n  Cotton 65%, Polyester 35%\n  Care Info: Cold Wash\n  Colors:\n  "
    //         "Gray - Ligh Blue - Mint - Mustard - Black - Indi pink\n  "
    //         "Sizes:\n  Free - L - XL\n\n  SELLER : Juston");
    //
    // allProducts.add(p3);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: PageView.builder(
              itemBuilder: (context, position) {
                return Slider[position];
              },
              itemCount: Slider.length,
            ),
            height: 200,
            color: Colors.brown[300],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 40,
                width: 400,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.brown[400]),
                    child: const Text(
                      'Add My Product',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) => AddProduct(
                                  allProducts,basketProducts, Users))));
                    })),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 30,
              color: Colors.brown[100],
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "  - Digital Products - ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                  Expanded(
                    child: GestureDetector(
                      child: Text(
                        " Show all Products >   ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        textAlign: TextAlign.right,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((BuildContext context) => AllProducts(
                                    allProducts, basketProducts, Users))));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: ListView.builder(
              itemBuilder: listRow,
              itemCount: allProducts.length,
              scrollDirection: Axis.horizontal,
            ),
            height: 300,
          ),
          Divider(
            color: Colors.brown[700],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 30,
              color: Colors.brown[100],
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "  - Fashion & Clothes - ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                  Expanded(
                    child: GestureDetector(
                      child: Text(
                        " Show all Products >   ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        textAlign: TextAlign.right,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((BuildContext context) => AllProducts(
                                    allProducts, basketProducts, Users))));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: ListView.builder(
              itemBuilder: listRow,
              itemCount: allProducts.length,
              scrollDirection: Axis.horizontal,
            ),
            height: 300,
          ),
          Divider(
            color: Colors.brown[700],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 30,
              color: Colors.brown[100],
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "  - Books & stationery - ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                  Expanded(
                    child: GestureDetector(
                      child: Text(
                        " Show all Products >   ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        textAlign: TextAlign.right,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((BuildContext context) => AllProducts(
                                    allProducts, basketProducts, Users))));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: ListView.builder(
              itemBuilder: listRow,
              itemCount: allProducts.length,
              scrollDirection: Axis.horizontal,
            ),
            height: 300,
          ),
          Divider(
            color: Colors.brown[700],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 30,
              color: Colors.brown[100],
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "  - Sports & Travel - ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
                  Expanded(
                    child: GestureDetector(
                      child: Text(
                        " Show all Products >   ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        textAlign: TextAlign.right,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((BuildContext context) => AllProducts(
                                    allProducts, basketProducts, Users))));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: ListView.builder(
              itemBuilder: listRow,
              itemCount: allProducts.length,
              scrollDirection: Axis.horizontal,
            ),
            height: 300,
          ),
        ],
      ),
    );
  }

  Widget listRow(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 160,
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
