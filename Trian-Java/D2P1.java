import java.io.File;
import java.util.Scanner;
import java.util.Map;
import java.util.HashMap;

class D2P1 {

    public static void main(String[] args) {
        verify();
    }

    public static void verify(){
        int doubles = 0, triples = 0, length = 0;
        Map<Character, Integer> charCount = new HashMap<Character, Integer>(Math.min(length, 26));
        String line;
        try {
            File file = new File("D2Input.txt");
            Scanner scan = new Scanner(file);
            while (scan.hasNextLine()) {
                line = scan.nextLine();
                length = line.length();
                int donce = 0, tonce = 0;
                charCount = new HashMap<Character, Integer>(Math.min(length, 26));
                for (int i = 0; i < length; ++i) {
                    char charFound = line.charAt(i);
                    if (!charCount.containsKey(charFound)){
                        charCount.put(charFound, 1);
                    } else {
                        charCount.put(charFound, charCount.get(charFound) + 1);
                    }
                }
                if (charCount.containsValue(2)){
                    if (!(donce > 0)){
                        doubles++;
                        donce++;
                    }
                }
                if (charCount.containsValue(3)){
                    if (!(tonce > 0)){
                        triples++;
                        tonce++;
                    }
                }
                charCount.clear();
            }
            System.out.println(doubles * triples);
            scan.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}