package com.example;
import java.sql.*;
import java.util.Scanner;
import de.vandermeer.asciitable.AsciiTable;
import de.vandermeer.asciitable.CWC_FixedWidth;
import de.vandermeer.skb.interfaces.transformers.textformat.TextAlignment;

class Main {
    public static void main(String[] args) throws SQLException{
        //The "Sports_Team" part must match the name of your postgres DB
        final String jdbcString = "jdbc:postgresql://localhost:5432/sports_team"; //credentials for our DB
        String user = ""; //postgres username
        String pass = ""; //postgres password
        Connection connection; 
        Scanner s = new Scanner(System.in);
        int option = -1;

        //obtain user credentials
        System.out.print("Enter your username for Sports_Team database (lowercase): ");
        user = s.nextLine();
        System.out.print("Enter your password for Sports_Team database: ");
        pass = s.nextLine();

        //attempt to create connection, function will throw exception if login is unsuccessful
        connection = createConnection(user,pass,jdbcString);
        
        //iterate through menu
        while (option != 5) { 
            option = getOption(s);
            switch (option) {
                case 1: // Query
                    String query = ""; //QUERY statement to pass to the DB
                    ResultSetMetaData rsMeta;
                    ResultSet response;
                    int colCount = -1;
                    
                    s.nextLine(); //consume extra newline
                    System.out.print("Enter all statements assuming postgresql syntax: ");
                    query = s.nextLine();
                    
                    //send query to database and save response
                    response = queryDatabase(query, connection);
                    rsMeta = response.getMetaData(); //retrieve meta data for column name and count info
                    colCount = rsMeta.getColumnCount();
                    //write table names to screen
                    System.out.print("TABLES QUERIED: " + rsMeta.getTableName(1));
                    for (int i = 2; i <= colCount; i++) {
                        String curTable = rsMeta.getTableName(i);
                        String prevTable = rsMeta.getTableName(i-1);
                        
                        if(i != colCount && !curTable.equals(prevTable)){
                            System.out.print(" + " + rsMeta.getTableName(i));
                        }

                        else if(!curTable.equals(prevTable)){
                            System.out.print(rsMeta.getTableName(i));
                        }
                    }
                    System.out.println();
                    //print response table
                    printTable(response, rsMeta, colCount);
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
            System.out.println("MENU");
            System.out.println("1. Query");
            System.out.println("2. Insert");                   
            System.out.println("3. Delete");
            System.out.println("4. Update");
            System.out.println("5. Quit");
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
    }//end getOption

    //makes a request to the DB using passed string as query
    public static ResultSet queryDatabase(String query, Connection connection){
        ResultSet rs = null;
        try {
            Statement statement = connection.createStatement();
             rs = statement.executeQuery(query);
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("Invalid query");
            e.printStackTrace();
        }
        
        return rs;
    }

    //establishes connection to the database
    public static Connection createConnection(String user, String pass, String url ){
        //boolean connectSuccess = true;
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(url, user, pass);
           
        } catch (Exception e) {
            //I believe program execution will end here, but not sure
            // TODO: handle exception
            System.out.println("Connection Failed");
            e.printStackTrace();

            //optionally add logic to determine cause of failure and 
        }

        return connection;
    }//end create connection

    //This function formats the data of the passed result set and prints a table using ascii table extension to console
    public static void printTable(ResultSet rs, ResultSetMetaData metaData, int columnCount) throws SQLException {
        AsciiTable table = new AsciiTable();

        // Dynamically set column widths
        CWC_FixedWidth cwc = new CWC_FixedWidth();
        for (int i = 0; i < columnCount; i++) {
            cwc.add(15);
        }
        table.getRenderer().setCWC(cwc);

        // Get column names and add as header row
        String[] headers = new String[columnCount];
        for (int i = 1; i <= columnCount; i++) {
            headers[i - 1] = metaData.getColumnName(i);
        }
        table.addRule();
        table.addRow((Object[]) headers).setTextAlignment(TextAlignment.CENTER);
        table.addRule();

        // Iterate through rows and add data to table
        while (rs.next()) {
            String[] row = new String[columnCount];
            for (int i = 1; i <= columnCount; i++) {
                row[i - 1] = rs.getString(i);
            }
            table.addRow((Object[]) row);
            table.addRule();
        }

        // Print the table
        String renderedTable = table.render();
        System.out.println(renderedTable);
    }
}//end main


