import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project/screens/Login.dart';
import 'package:flutter/services.dart';

import 'Product.dart';
import 'User.dart';

class SignUp extends StatelessWidget {

  List<Product> allProducts;
  List<Product> basketProducts;
  List<User> Users;
  SignUp(List<Product> allProducts,List<Product> basketProducts,  List<User> Users){
    this.allProducts = allProducts;
    this.basketProducts = basketProducts;
    this.Users = Users;
  }
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
        body: MyStatefulWidget(allProducts,basketProducts,Users),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  List<Product> allProducts;
  List<Product> basketProducts;
  List<User> Users;
  MyStatefulWidget(List<Product> allProducts,List<Product> basketProducts,  List<User> Users){
    this.allProducts = allProducts;
    this.basketProducts = basketProducts;
    this.Users = Users;
  }
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey_Name = GlobalKey<FormState>();
  final _formKey_Pass = GlobalKey<FormState>();
  final _formKey_Phonum = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenumController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  String toShow = "";
  bool cansignin = true;


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
                  'Sign up',
                  style: TextStyle(
                      fontSize: 20, fontFamily: 'Akshar', color: Colors.black),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _formKey_Name,
                child: TextFormField(

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Full Name Can not be empty';
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    labelText: 'FullName',
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Form(
                key: _formKey_Phonum,
                child: TextFormField(

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number Can not be empty';
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  obscureText: true,
                  controller: phonenumController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    labelText: 'Phone Number',
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _formKey_Pass,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password Can not be empty';
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  controller: passController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    labelText: 'Password',
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                cursorColor: Colors.black,
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  floatingLabelStyle: TextStyle(color: Colors.black),
                  labelText: 'Email (Optional)',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                cursorColor: Colors.black,
                controller: storeNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  floatingLabelStyle: TextStyle(color: Colors.black),
                  labelText: 'Store Name (Optional)',
                ),
              ),
            ),
            Container(
              child: Text(toShow,style: TextStyle(color: Colors.red),),
              alignment: Alignment.center,
            ),
            Divider(

            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.brown[400]),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      if (_formKey_Name.currentState.validate() &
                          _formKey_Phonum.currentState.validate() &
                          _formKey_Pass.currentState.validate()) {
                        send(nameController.text+"~~"+phonenumController.text+"~~"+passController.text+"~~"+emailController.text+"~~"+storeNameController.text);
                        if(cansignin){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((BuildContext context) =>
                                      Login())));
                        }
                      }
                    })),
          ],
        ));
  }
  send(String message) async {
    String req = "signup~~" + message + "\u0000";

    await Socket.connect("192.168.89.158", 8000).then((serverSocket) {
      serverSocket.write(req);
      serverSocket.flush();
      print("message sent");
      serverSocket.listen((response) {
        print(String.fromCharCodes(response)+"\n");
        String res = String.fromCharCodes(response);
        if(res == "false" || res == "alse"){
          cansignin = false;
        }
        else {
          cansignin = true;
          final values = res.split("~~");
          User newUser = new User(values[0],values[1],values[2],values[3],values[4]);
          widget.Users.add(newUser);
        }
      });
    });
  }
}
