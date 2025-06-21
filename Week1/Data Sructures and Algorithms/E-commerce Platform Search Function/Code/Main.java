import java.util.Arrays;
import java.util.Comparator;

public class Main {
    public static void main(String[] args) {
        Product[] products = {
            new Product(103, "Blender", "Home Appliances"),
            new Product(101, "Shirt", "Clothing"),
            new Product(105, "Chair", "Furniture"),
            new Product(102, "Book", "Stationery"),
            new Product(104, "Shoes", "Footwear")
        };

        //Linear Search
        Product result1 = LinearSearch.search(products, 105);
        System.out.println("Linear Search Result: " + (result1 != null ? result1 : "Not Found"));

        //Sort before Binary Search
        Arrays.sort(products, Comparator.comparingInt(p -> p.productId));

        //Binary Search
        Product result2 = BinarySearch.search(products, 103);
        System.out.println("Binary Search Result: " + (result2 != null ? result2 : "Not Found"));
    }
}
