package Digikala;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class convertor {

    public List<User> fileToUserList(FileReader file) throws IOException {
        List<User> Users = new ArrayList<>();
        BufferedReader input = new BufferedReader(file);
        String S;

        while ((S = input.readLine())!= null){
            String[] splited = S.split("~~");
            String[] test = new String[5];
            for (int i=0; i<splited.length; i++){
                test[i] = splited[i];
            }

            User newUser = new User(test[0],test[1],test[2],test[3],test[4]);
            Users.add(newUser);
        }
        return Users;
    }
}
