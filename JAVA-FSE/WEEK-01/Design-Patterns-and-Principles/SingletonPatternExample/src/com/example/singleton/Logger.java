package com.example.singleton;

public class Logger {

    private static Logger obj;

    private Logger() {
        System.out.println("Logger Initialized");
    }

    public static Logger getInstance() {
        if (obj == null) {
            obj = new Logger();
        }
        return obj;
    }

    public void log(String msg) {
        System.out.println("LOG : " + msg);
    }
}