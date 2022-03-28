import java.util.Scanner;
import 

public class Main {
    private Connection connection;

    private PreparedStatement createHolderStmt;
    private PreparedStatement findHolderPKStmt;
    private PreparedStatement createAccountStmt;
    private PreparedStatement findAccountByNameStmt;


    public BankDAO() throws BankDBException {
        try {
            connectToBankDB();
            prepareStatements();
        } catch (ClassNotFoundException | SQLException exception) {
            throw new BankDBException("Could not connect to datasource.", exception);
        }
    }


    private void connectToDatabase() throws ClassNotFoundException, SQLException {
        connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/soundgood",
                                                 "postgres", "postgres");
        connection.setAutoCommit(false);
        return connection;
    }

    public void runInterface() {
        try {
            Scanner scanner = new Scanner(System.in);
            while(true) {
                interfaceMenu();
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
            ex.printStackTrace();
        }
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
      runInterface();
    }
}
