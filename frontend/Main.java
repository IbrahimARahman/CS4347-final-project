package frontend;

import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        int option = -1;
        while (option != 5) { 
            option = getOption(s);
            switch (option) {
                case 1: // Query
                    break;
                case 2: // Insert
                    break;
                case 3: // Delete
                    break;
                case 4: // Update
                    break;

                default:
                    break;
            }
        }
        System.out.println("Ending Program");
    }

    public static int getOption(Scanner s) {
        int selectedOption = -1;

        while (true) {
            System.out.println("""
                               1. Query
                               2. Insert
                               3. Delete
                               4. Update
                               5. Quit
                               """);
            System.out.print("Choose menu option (1-5): ");

            // Check if the input is an integer
            if (s.hasNextInt()) {
                selectedOption = s.nextInt();

                // Validate the integer is within the range 1-5
                if (selectedOption >= 1 && selectedOption <= 5) {
                    break;  // Exit the loop if valid
                } else {
                    System.out.println("Invalid option. Please choose a number between 1 and 5.");
                }
            } else {
                System.out.println("Invalid input. Please enter an integer.");
                s.next();  // Consume the invalid input
            }
        }

        return selectedOption;
    }
}
