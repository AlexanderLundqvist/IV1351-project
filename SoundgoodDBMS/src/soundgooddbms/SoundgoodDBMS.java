package soundgooddbms;
import java.util.*;
import java.sql.*;

/**
 * This class is a basic assdfjsdfkjsfkjn
 * @author Alexander Lundqvist & Max Dern
 */
public class SoundgoodDBMS {
    private String database = "soundgood";
    private String user     = "postgres";
    private String password = "postgres";
    
    private PreparedStatement listAllInstrumentsStmt;
    private PreparedStatement createNewRentalStmt;
    private PreparedStatement terminateRentalStmt;
    private PreparedStatement checkStudentRentalsStmt;
        
    /**
     * 
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    private Connection connectToDatabase() throws SQLException, ClassNotFoundException {
        System.out.println("Trying to connect to database...");
        Connection connection = null;
        try {
            //Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/" + database, user, password);
            connection.setAutoCommit(false);
            System.out.println("Connection established!");
        } catch (Exception ex) {
            System.out.println("Couldn't connect to database: " + ex);
            ex.printStackTrace();
        }
        return connection;
    }
    
    private void accessDatabase() {
        
    }
    
    private void listAllInstruments() {
        try (ResultSet instruments = listAllInstrumentsStmt.executeQuery()) {
            while (instruments.next()) {
              System.out.println(
                "ID: " + instruments.getString(1) +
                ", Name: " + instruments.getString(5) + 
                ", Type: " + instruments.getString(2) + 
                ", Brand: " + instruments.getString(3));
            }
        } catch (SQLException sqle) {
            //connection.rollback();
            sqle.printStackTrace();
        }
    }
    
    private void rentInstrument() {
        
    }
    
    private void terminateRental() {
        
    }
     
    /**
     * 
     * @param connection
     * @throws SQLException 
     */
    private void prepareStatements(Connection connection) throws SQLException {
        listAllInstrumentsStmt = connection.prepareStatement("SELECT * FROM rental_instrument_inventory WHERE rented = FALSE");
        createNewRentalStmt = connection.prepareStatement("SELECT * FROM rental_instrument_inventory");
        terminateRentalStmt = connection.prepareStatement("SELECT * FROM rental_instrument_inventory");
    }
    
    /**
     * CLI menu.
     */
    private void interfaceMenu() {
       System.out.println("*************************************************************");
       System.out.println("********  Soundgood music school - Instrument rental ********");
       System.out.println("*************************************************************");
       System.out.println("*                                                           *");
       System.out.println("* 1. List all instruments.                                  *");
       System.out.println("* 2. Rent instrument.                                       *");
       System.out.println("* 3. Terminate rental.                                      *");
       System.out.println("* 4. Exit rental interface                                  *");
       System.out.println("*                                                           *");
       System.out.println("*************************************************************");
    }
    
    /**
     * 
     * @param args takes no CLI commands.
     */
    public static void main(String[] args) {
        SoundgoodDBMS dbms = new SoundgoodDBMS();
        try {
            Scanner scanner = new Scanner(System.in);
            Connection DBconnection = dbms.connectToDatabase();
            dbms.prepareStatements(DBconnection);
            while(true) {
                dbms.interfaceMenu();
                System.out.println("Enter you choice: ");
                int choice = scanner.nextInt();
                System.out.println();
                switch (choice) {
                    case 1:
                        System.out.println("Listing instruments");
                        dbms.listAllInstruments();
                        break;
                    case 2:
                        System.out.println("Enter rental process here");
                        dbms.rentInstrument();
                        break;
                    case 3:
                        System.out.println("Enter termination process here");
                        dbms.terminateRental();
                        break;
                    case 4:
                        System.out.println("\nExiting...");
                        Thread.sleep(1200);
                        System.exit(1);
                        break;
                }
                System.out.println();
            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex);
        }
    }
}
