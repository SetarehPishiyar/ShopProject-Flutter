package Digikala.network;

import Digikala.convertor;

import java.io.File;
import java.io.FileReader;
import java.net.ServerSocket;
import java.net.Socket;

public class server {
    public void start() throws Exception{
        ServerSocket ss = new ServerSocket(8000);

        while (true){
            Socket socket = ss.accept();
            new clientHandler(socket).run();
        }

    }
}
