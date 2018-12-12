import java.io.File;
import java.util.Scanner;



class D1P1 {

    public static void main(String[] args) {
        int number = findFirst();
        System.out.println(number);
    }

    public static int findFirst(){
        int total = 0;
        try {
            File file = new File("input.txt");
            Scanner scan = new Scanner(file);
            int[] array = new int[10000];
            array[0] = 0;
            while (scan.hasNextLine()) {
                String line = scan.nextLine();
                total += Integer.parseInt(line);
            }
            scan.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;

    }
}