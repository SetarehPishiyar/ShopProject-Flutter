package Digikala.controller;

import Digikala.Product;
import Digikala.User;

import java.io.*;
import java.util.Formatter;
import java.util.List;

public class controller {

    public String signup(String userData, FileWriter userFile, List<User> users) throws IOException {

        BufferedWriter writer = new BufferedWriter(userFile);
        boolean isInList = false;
        String toWrite = "false";
        String[] splitedData = userData.split("~~");
        String[] test = new String[6];
        for (int i=0; i<splitedData.length;i++){
            test[i] = splitedData[i];
        }

        for (User u : users) {
            if (u.getPhonenumber().equals(test[2])){
                isInList = true;
            }
        }
        if(!isInList) {
            toWrite = test[1] + "~~" + test[2] + "~~" + test[3] + "~~" + test[4] + "~~" + test[5];
            writer.write(toWrite + "\n");
            writer.close();
        }
        return toWrite;
    }

    public Boolean login(String userData, List<User> users) {
        String[] splitedData = userData.split("~~");

        for (User u : users) {
            if (u.getPhonenumber().equalsIgnoreCase(splitedData[1])) {
                if (u.getPassword().equals(splitedData[2]))
                    return true;
                else
                    return false;
            }
            else
                return false;
        }
        return false;
    }

    public String addProduct(String productData, FileWriter productFile) throws IOException {
        BufferedWriter writer = new BufferedWriter(productFile);
        String toWrite = "";
        String[] splited  = productData.split("~~");
        String[] test = new String[10];
        for (int i=0; i<splited.length;i++){
            test[i] = splited[i];
        }
        toWrite = test[1]+"~~"+test[3]+"~~"+test[5]+"~~"+test[2]+"~~"+"images/noImage.png"+"~~"+test[8]+"~~"+test[9]+"~~"+test[6]+"~~"+test[7]+"~~"+test[4]+"~~"+"~~"+"~~"+"false"+"~~"+"false";
        writer.write(toWrite + "\n");
        writer.close();

        return toWrite;
    }


}
