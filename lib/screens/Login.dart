import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project/screens/Signup.dart';
import 'package:project/screens/homepage.dart';
import 'package:flutter/services.dart';
import 'package:project/screens/Product.dart';
import 'package:flutter/painting.dart';
import 'dart:convert';

import 'User.dart';

class Login extends StatelessWidget {
  List<Product> allProducts = new List();
  List<Product> basketProducts = new List();
  List<Product> digitalProducts = new List();
  List<Product> FashionProducts = new List();
  List<Product> BooksProducts = new List();
  List<Product> SportsProducts = new List();

  List<User> Users = new List();

  // Login(List<Product> allProducts,List<Product> basketProducts,  List<User> Users){
  //   this.allProducts = allProducts;
  //   this.basketProducts = basketProducts;
  //   this.Users = Users;
  // }
  static const String _title = '-Choco Shop-';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
            backgroundColor: Colors.brown[400],
            centerTitle: true,
            title: const Text(
              _title,
              style: TextStyle(color: Colors.black, fontFamily: 'Akshar'),
            )),
        body: MyStatefulWidget(allProducts, basketProducts, Users),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  List<Product> allProducts;
  List<Product> basketProducts;
  List<User> Users;

  MyStatefulWidget(List<Product> allProducts, List<Product> basketProducts,
      List<User> Users) {
    this.allProducts = allProducts;
    this.basketProducts = basketProducts;
    this.Users = Users;
  }

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _isVisible = false;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  bool canLogin = false;
  TextEditingController phonenumController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 20, fontFamily: 'Akshar', color: Colors.black),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  controller: phonenumController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    labelText: 'Enter Phone Number',
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Form(
                key: _formKey2,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  controller: passController,
                  obscureText: _isVisible ? false : true,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                  ],
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    hintText: "Enter Password",
                    suffixIcon: IconButton(
                      onPressed: () => updateStatus(),
                      icon: Icon(
                          _isVisible ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(fontFamily: 'Akshar', color: Colors.black),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.brown[400]),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      initProducts();
                      initUsers();
                      if (_formKey.currentState.validate() &
                          _formKey2.currentState.validate()) {
                        send(phonenumController.text +
                            "~~" +
                            passController.text);
                        for(int i=0; i<widget.Users.length; i++){
                          if(widget.Users[i].phonenumber == phonenumController.text){
                            if(widget.Users[i].password == widget.Users[i].password){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((BuildContext context) =>
                                          HomePage(
                                              widget.allProducts,
                                              widget.basketProducts,
                                              widget.Users))));
                            }
                          }
                        }
                        // if (canLogin) {
                        //   initProducts();
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: ((BuildContext context) =>
                        //               HomePage(
                        //                   widget.allProducts,
                        //                   widget.basketProducts,
                        //                   widget.Users))));}
                        // else
                        //   print("You can not log in");
                      }
                    })),
            Row(
              children: <Widget>[
                const Text(
                  'Does not have account?',
                  style: TextStyle(color: Colors.black, fontFamily: 'Akshar'),
                ),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Akshar',
                        color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((BuildContext context) => SignUp(
                                widget.allProducts,
                                widget.basketProducts,
                                widget.Users))));
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }

  send(String message) async {
    String req = "login~~" + message + "\u0000";

    await Socket.connect("192.168.89.158", 8000).then((serverSocket) {
      serverSocket.write(req);
      serverSocket.flush();
      serverSocket.listen((response) {
        String res = String.fromCharCodes(response);
        print(res);
        print(canLogin.toString());
        if (res == "true") canLogin = true;
        print(canLogin.toString());
      });
    });
  }

  initUsers() async {
    String req = "initusers" + "\u0000";
    List<User> users = new List();
    await Socket.connect("192.168.89.158", 8000).then((serverSocket) {
      serverSocket.write(req);
      serverSocket.flush();
      serverSocket.listen((response) {
        String res = String.fromCharCodes(response);
        final values = res.split("@@");
        for (int i = 0; i < values.length - 1; i++) {
          final toWrite = values[i].split("~~");

          User newUser = new User(
              toWrite[0], toWrite[1], toWrite[2], toWrite[3], toWrite[4]);
          users.add(newUser);
          widget.Users = users;
        }
      });
    });
  }

  initProducts() async {
    String req = "initproducts" + "\u0000";
    List<Product> products = new List();

    await Socket.connect("192.168.89.158", 8000).then((serverSocket) {
      serverSocket.write(req);
      serverSocket.flush();
      serverSocket.listen((response) {
        String res = String.fromCharCodes(response);
        final values = res.split("@@");
        for (int i = 0; i < values.length - 1; i++) {
          final toWrite = values[i].split("~~");
          int price = int.parse(toWrite[1]);
          int count = int.parse(toWrite[9]);
          // List<String> colors = toWrite[7].split("-");
          // List<String> sizes = toWrite[8].split("-");
          Product newProduct = new Product(
              toWrite[0],
              price,
              count,
              toWrite[2],
              toWrite[3],
              new List(),
              new List(),
              toWrite[5],
              toWrite[6],
              toWrite[4]);
          products.add(newProduct);
          widget.allProducts = products;
        }
      });
    });
  }

  initCategory() {
    for (int i = 0; i < widget.allProducts.length; i++) {
      if (widget.allProducts[i].category == "Digital Products") {}
    }
  }
}
