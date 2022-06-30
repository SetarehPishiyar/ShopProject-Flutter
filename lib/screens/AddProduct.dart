import 'dart:collection';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project/screens/Product.dart';

import 'User.dart';
import 'homepage.dart';

class AddProduct extends StatelessWidget {

  TextEditingController nameController = TextEditingController();
  TextEditingController sellerController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<Product> allProducts;
  List<Product> basketProducts;
  List<User> Users;
  AddProduct(List<Product> allProducts,List<Product> basketProducts,  List<User> Users){
    this.allProducts = allProducts;
    this.basketProducts = basketProducts;
    this.Users = Users;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Product Page",
            style: TextStyle(fontFamily: 'Akshar', color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.brown[500],
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
          child: Container(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: TextFormField(
                    controller: sellerController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      labelText: 'Seller',
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: TextFormField(
                    controller: priceController,
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    labelText: 'price',
                  )),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: TextFormField(
                    controller: countController,
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    labelText: 'Count',
                  )),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: TextFormField(
                    controller: descriptionController,
                      minLines: 5,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        floatingLabelStyle: TextStyle(color: Colors.black),
                        labelText: 'Description',
                      )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Text(
                        "Choose Colors",
                        style: TextStyle(fontFamily: 'Akshar', fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 3,
                        children: <Widget>[
                          filterChipWidget(
                            chipName: 'Yellow',
                          ),
                          filterChipWidget(
                            chipName: 'Red',
                          ),
                          filterChipWidget(
                            chipName: 'Pink',
                          ),
                          filterChipWidget(
                            chipName: 'Blue',
                          ),
                          filterChipWidget(
                            chipName: 'Black',
                          ),
                          filterChipWidget(
                            chipName: 'Green',
                          ),
                          filterChipWidget(
                            chipName: 'White',
                          ),
                          filterChipWidget(
                            chipName: 'Navy',
                          ),
                          filterChipWidget(
                            chipName: 'Beige',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Text(
                        "Choose Sizes",
                        style: TextStyle(fontFamily: 'Akshar', fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 3,
                        children: <Widget>[
                          filterChipWidget(
                            chipName: 'S',
                          ),
                          filterChipWidget(
                            chipName: 'M',
                          ),
                          filterChipWidget(
                            chipName: 'XL',
                          ),
                          filterChipWidget(
                            chipName: 'XXL',
                          ),
                          filterChipWidget(
                            chipName: 'FreeSize',
                          ),
                          filterChipWidget(
                            chipName: 'No Size',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Text(
                        "Choose Category",
                        style: TextStyle(fontFamily: 'Akshar', fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 3,
                        children: <Widget>[
                          filterChipWidget(
                            chipName: 'Fashion And Clothes',
                          ),
                          filterChipWidget(
                            chipName: 'Books And Stationary',
                          ),
                          filterChipWidget(
                            chipName: 'Sports And Travel',
                          ),
                          filterChipWidget(
                            chipName: 'Digital Products',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Text(
                        "Choose SubCategory",
                        style: TextStyle(fontFamily: 'Akshar', fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 3,
                        children: <Widget>[
                          filterChipWidget(
                            chipName: 'Woman',
                          ),
                          filterChipWidget(
                            chipName: 'Men',
                          ),
                          filterChipWidget(
                            chipName: 'Kids',
                          ),
                          filterChipWidget(
                            chipName: 'Moblie Phone',
                          ),
                          filterChipWidget(
                            chipName: 'LapTop',
                          ),
                          filterChipWidget(
                            chipName: 'Camera',
                          ),
                          filterChipWidget(
                            chipName: 'Book',
                          ),
                          filterChipWidget(
                            chipName: 'Stationary',
                          ),
                          filterChipWidget(
                            chipName: 'Music',
                          ),
                          filterChipWidget(
                            chipName: 'HandCrafts',
                          ),
                          filterChipWidget(
                            chipName: 'Sport Clothes',
                          ),
                          filterChipWidget(
                            chipName: 'Sport Equipments',
                          ),
                          filterChipWidget(
                            chipName: 'Travel And Camping Equipments',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: 30,
                ),
                ButtonTheme(
                  child: RaisedButton(
                    onPressed: () {
                      send(nameController.text+"~~"+sellerController.text+"~~"+priceController.text+"~~"+countController.text+"~~"+descriptionController.text+"~~"+"colors"+"~~"+"Sizes"+"~~"+"category"+"~~"+"subcategory");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((BuildContext context) => HomePage(
                                  allProducts,basketProducts, Users))));
                    },
                    color: Colors.brown[300],
                    child: Text(
                      "Submit Product",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  height: 50,
                  minWidth: 300,
                ),
                Divider(
                  color: Colors.white,
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  send(String message) async {
    String req = "addproduct~~" + message + "\u0000";

    await Socket.connect("192.168.89.158", 8000).then((serverSocket) {
      serverSocket.write(req);
      serverSocket.flush();
      print("message sent");
      serverSocket.listen((response) {
        print(String.fromCharCodes(response));
        String res =  String.fromCharCodes(response);
        final values = res.split("~~");
        List<String> colors = values[7].split("-");
        List<String> sizes = values[8].split("-");
        Product newProduct = new Product(values[0], int.parse(values[1]), int.parse(values[9]), values[2], values[3], colors, sizes, values[5], values[6],"images/noImage.png");
        allProducts.add(newProduct);
      });
    });
  }
}

class filterChipWidget extends StatefulWidget {
  final String chipName;

  const filterChipWidget({Key key,this.chipName}) : super(key: key);



  @override
  State<filterChipWidget> createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;


  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle:
          TextStyle(fontSize: 15, fontFamily: 'Akshar', color: Colors.black),
      selected: _isSelected,
      backgroundColor: Colors.brown[100],
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Colors.brown[300],
    );
  }
}


