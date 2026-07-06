package com.example.search;
import java.util.Arrays;
import java.util.Comparator;

public class SearchDemo {

    public static Product linearSearch(Product[] p, String name) {

        for (Product x : p) {
            if (x.productName.equalsIgnoreCase(name))
                return x;
        }

        return null;
    }

    public static Product binarySearch(Product[] p, String name) {

        int l = 0;
        int r = p.length - 1;

        while (l <= r) {

            int m = (l + r) / 2;

            int c = p[m].productName.compareToIgnoreCase(name);

            if (c == 0)
                return p[m];

            if (c < 0)
                l = m + 1;
            else
                r = m - 1;
        }

        return null;
    }

    public static void main(String[] args) {

        Product[] a = {
                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Shoes", "Fashion"),
                new Product(103, "Mobile", "Electronics"),
                new Product(104, "Watch", "Accessories"),
                new Product(105, "Bag", "Fashion")
        };

        Product p1 = linearSearch(a, "Mobile");

        if (p1 != null)
            System.out.println("Linear Search : " + p1.productName + " Found");
        else
            System.out.println("Product Not Found");

        Arrays.sort(a, Comparator.comparing(x -> x.productName));

        Product p2 = binarySearch(a, "Mobile");

        if (p2 != null)
            System.out.println("Binary Search : " + p2.productName + " Found");
        else
            System.out.println("Product Not Found");
    }
}