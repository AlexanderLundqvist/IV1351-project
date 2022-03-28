import java.util.*;
import java.sql.*;


/**
 * This class is a basic assdfjsdfkjsfkjn
 * @author Alexander Lundqvist & Max Dern
 */
public class Main {
    private PreparedStatement listAllInstrumentsStmt;
    private PreparedStatement createNewRentalStmt;
    private PreparedStatement terminateRentalStmt;
    private PreparedStatement checkStudentRentalsStmt;
    private Connection DBconnection;

    private void connectToDatabase() throws SQLException, ClassNotFoundException {
        try {
            DBconnection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/soundgood", "postgres", "postgres");
            DBconnection.setAutoCommit(false);
            System.out.println("Connection established!");
        } catch (Exception ex) {
            System.out.println("Couldn't connect to database...");
        }
    }

    private void prepareStatements(Connection connection) throws SQLException {
        listAllInstrumentsStmt = connection.prepareStatement("SELECT * FROM rental_instrument_inventory WHERE rented = FALSE");
        createNewRentalStmt = connection.prepareStatement("SELECT * FROM rental_instrument_inventory");
        terminateRentalStmt = connection.prepareStatement("SELECT * FROM rental_instrument_inventory");
    }

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

    public static void main(String[] args) {
        Main dbms = new Main();
        try {
            dbms.connectToDatabase();
            Scanner scanner = new Scanner(System.in);
            while(true) {
                dbms.interfaceMenu();
                System.out.println("Enter you choice: ");
                int choice = scanner.nextInt();
                System.out.println();
                switch (choice) {
                    case 1:
                        System.out.println("Listing instruments");
                        // Do something
                        break;
                    case 2:
                        System.out.println("Enter rental process here");
                        // Do something else
                        break;
                    case 3:
                        System.out.println("Enter termination process here");
                        // Terminate something
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
