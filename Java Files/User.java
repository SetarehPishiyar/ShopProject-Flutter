package Digikala;

public class User {

    private String Name;
    private String phonenumber;
    private String password;
    private String email;
    private String storename;


    public User(String name, String phonenumber, String password, String email, String storename) {
        Name = name;
        this.phonenumber = phonenumber;
        this.password = password;
        this.email = email;
        this.storename = storename;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public String getPassword() {
        return password;
    }
}
