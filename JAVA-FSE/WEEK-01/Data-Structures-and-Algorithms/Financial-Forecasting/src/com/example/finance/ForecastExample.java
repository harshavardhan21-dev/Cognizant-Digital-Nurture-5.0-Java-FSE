package com.example.finance;

public class ForecastExample {

    public static double forecast(double value, double rate, int years) {

        if (years == 0)
            return value;

        return forecast(value * (1 + rate), rate, years - 1);
    }

    public static void main(String[] args) {

        double currentValue = 10000;
        double growthRate = 0.10;
        int years = 5;

        double futureValue = forecast(currentValue, growthRate, years);

        System.out.println("Current Value : " + currentValue);
        System.out.println("Growth Rate : " + (growthRate * 100) + "%");
        System.out.println("Years : " + years);
        System.out.println("Future Value : " + futureValue);
    }
}