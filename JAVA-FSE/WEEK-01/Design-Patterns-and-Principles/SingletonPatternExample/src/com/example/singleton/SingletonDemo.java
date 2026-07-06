package com.example.singleton;

public class SingletonDemo {

    public static void main(String[] args) {

        Logger l1 = Logger.getInstance();
        l1.log("First Message");

        Logger l2 = Logger.getInstance();
        l2.log("Second Message");

        System.out.println(l1 == l2);
    }
}