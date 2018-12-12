import java.io.File;
import java.util.Scanner;
import java.util.Set;
import java.util.Stack;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

class D2P2 {

    public static List<String> codeList = new ArrayList<String>();

    public static void main(String[] args) {
        verify();
        findCodes(codeList);
    }

    public static void verify(){
        int length = 0;
        Map<Character, Integer> charCount = new HashMap<Character, Integer>(Math.min(length, 26));
        String line;
        try {
            File file = new File("D2Input.txt");
            Scanner scan = new Scanner(file);
            while (scan.hasNextLine()) {
                line = scan.nextLine();
                length = line.length();
                charCount = new HashMap<Character, Integer>(Math.min(length, 26));
                for (int i = 0; i < length; ++i) {
                    char charFound = line.charAt(i);
                    if (!charCount.containsKey(charFound)){
                        charCount.put(charFound, 1);
                    } else {
                        charCount.put(charFound, charCount.get(charFound) + 1);
                    }
                }
                codeList.add(line);
            }
            scan.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void findCodes(List<String> list) {
        int mistakesAllowed;
        String solution = null;
        for (int i = 0; i < list.size(); i++) {
            String word1 = list.get(i);
            for (int j = i + 1; j < list.size(); j++) {
                mistakesAllowed = 1;
                String word2 = list.get(j);
                if(word1.length() == word2.length()) { 
                    for(int k = 0; k < word1.length(); k++) { 
                        if(word1.charAt(k) != word2.charAt(k)) { 
                            mistakesAllowed--; 
                            if(mistakesAllowed < 0) { 
                                break;
                            }
                        }
                    }

                    if (mistakesAllowed == 0) {
                        System.out.println("Success.");
                        System.out.println("Code 1: " + word1);
                        System.out.println("Code 2: " + word2);
                        for(int l = 0; l < word1.length(); l++) { 
                            if(word1.charAt(l) != word2.charAt(l)) { 
                                System.out.println("Replace this character: " + word1.charAt(l) + "!");
                            }
                        }
                        solution = word1.replace('g', ' ');
                        System.out.println("Solution (Delete whitespace): " + solution);
                    }
                }
            }
        }
    }
}