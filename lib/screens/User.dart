class User {
  String Name;
  String phonenumber;
  String password;
  String email;
  String storename;

  User(String name, String phonenumber, String password, String email,
      String storename) {
    Name = name;
    this.phonenumber = phonenumber;
    this.password = password;
    this.email = email;
    this.storename = storename;
  }
}
