import java.sql.*;

public class ConnectTest {
    public static void main(String[] args) throws Exception {
        final String jdbcString = "jdbc:postgresql://localhost:5432/Sports_Team";
        String user = "username"; 
        String pass = "password";
        String query = "SELECT * FROM TEAM;"; //QUERY to return all tuples under team table in Sports_Team project

       try {
            //Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(jdbcString, user, pass);
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            
            int i = 0;
            while (rs.next()) {
                int id = rs.getInt("teamid");
                String name = rs.getString("name");
                System.out.println(i + " " + id + " " + name);
                i++;
            }
           
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println("Connection Failed");
            e.printStackTrace();
        }
        


    }
}
