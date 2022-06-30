package Digikala.network;

import Digikala.User;
import Digikala.controller.controller;
import Digikala.convertor;

import javax.xml.crypto.dsig.dom.DOMSignContext;
import java.io.*;
import java.net.Socket;
import java.util.List;
import java.util.Scanner;

public class clientHandler extends Thread {
    private Socket socket;

    public clientHandler(Socket socket){
        this.socket = socket;
    }

    @Override
    public void run(){
        try{
            DataInputStream dis = new DataInputStream(socket.getInputStream());
            DataOutputStream dos = new DataOutputStream(socket.getOutputStream());
            convertor converTor = new convertor();
            controller contRoller = new controller();
            List<User> Users = converTor.fileToUserList(new FileReader("D:\\Ap\\project\\Files\\Users.txt"));

            StringBuilder req = new StringBuilder();
            int c = dis.read();
            while (c != 0){
                req.append((char) c);
                c = dis.read();
            }
            String toSend = "";

            String[] reqSplited = req.toString().split("~~");

            if(reqSplited[0].equals("signup")){
                toSend = contRoller.signup(req.toString(), new FileWriter("D:\\Ap\\project\\Files\\Users.txt", true), Users);
            }
            else if(reqSplited[0].equals("login")){
                boolean Login = contRoller.login(req.toString(), Users);
                if (Login)
                    toSend = "true";
                else
                    toSend = "false";
            }
            else if(reqSplited[0].equals("addproduct")){
                toSend = contRoller.addProduct(req.toString(),new FileWriter("D:\\Ap\\project\\Files\\Products.txt",true));
            }
            else if(reqSplited[0].equals("initusers")){
                BufferedReader bufferedReader = new BufferedReader(new FileReader("D:\\Ap\\project\\Files\\Users.txt"));
                String S = "";
                while ((S = bufferedReader.readLine())!=null){

                    toSend+=S+"@@";
                }
            }
            else if(reqSplited[0].equals("initproducts")){
                BufferedReader bufferedReader = new BufferedReader(new FileReader("D:\\Ap\\project\\Files\\Products.txt"));
                String S = "";
                while ((S = bufferedReader.readLine())!=null){
                    toSend+=S+"@@";
                }
            }

            dos.writeBytes(toSend);
            dos.flush();
            System.out.println("sent");

            dis.close();
            dos.close();
            socket.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
