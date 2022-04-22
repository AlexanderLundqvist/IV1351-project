package soundgooddbms;
import java.util.*;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * This class is a basic program that lets the user manage instrument rentals at
 * the music school Soundgood. It does not have any security at all so the user
 * can manage the rentals however they like.
 * @author Alexander Lundqvist & Max Dern
 */
public class SoundgoodDBMS {
    private String database = "soundgood";
    private String user     = "postgres";
    private String password = "postgres";
    private Connection connection;
    
    private PreparedStatement listAllInstrumentsStmt;
    private PreparedStatement createNewLeaseContractStmt;
    private PreparedStatement terminateLeaseContractStmt;
    private PreparedStatement updateInstrumentStatusStmt;
    private PreparedStatement updateInstrumentQuotaStmt;
    private PreparedStatement activeLeaseContractStmt;
    private PreparedStatement checkInstrumentQuotaStmt;
    private PreparedStatement checkInstrumentAvailabilityStmt;
        
    /**
     * Creates a connection between the program and the database.
     * @return the established connection
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
    
    /**
     * This method lists all the instruments that are available for rental.
     */
    private void listAllInstruments() throws SQLException {
        String failMsg = "Could not find any instruments";
        ResultSet instruments = null;
        try {
            instruments = listAllInstrumentsStmt.executeQuery();
            while (instruments.next()) {
              System.out.println(
                "ID: " + instruments.getInt(1) +
                ", Name: " + instruments.getString(5) + 
                ", Model number: " + instruments.getString(4) +
                ", Type: " + instruments.getString(2) + 
                ", Brand: " + instruments.getString(3) +
                ", Price: " + instruments.getInt(6));
            }
        } catch (SQLException sqle) {
            //connection.rollback();
            sqle.printStackTrace();
        } finally {
            closeResultSet(failMsg, instruments);
        }
    }
       
    
    private void listAllContracts(Connection connection, int studenttermId) throws SQLException {
        String failMsg = "Could not find any contracts";
        ResultSet contract = null;
        try {
            activeLeaseContractStmt.setInt(1, studenttermId);
            //activeLeaseContractStmt.execute();
            contract = activeLeaseContractStmt.executeQuery();
            while (contract.next()) {

                System.out.println(
                 "Instrument ID: " + contract.getInt(2) +
                ", Start date: " + contract.getString(4) + 
                ", End date: " + contract.getString(5) +
                ", Type: " + contract.getString(3) + 
                ", Student ID: " + contract.getString(6));
                //", Active: " + contract.getString(7));
            }
        } catch (SQLException sqle) {
            //connection.rollback();
            //sqle.printStackTrace();
            handleException(failMsg, sqle);
        } finally {
            closeResultSet(failMsg, contract);
        }
    }
    
    /**
     * Performs the instrument rental process.
     * @param connection the database connection
     * @param instrumentId the id of the instrument
     * @param startDate the start date of the rental
     * @param endDate the end date of the rental
     * @param studentId the id of the student
     * @throws SQLException 
     */
    private void rentInstrument(Connection connection, int instrumentId, Timestamp startDate, Timestamp endDate, int studentId) throws SQLException {
        try (ResultSet instruments = checkInstrumentQuotaStmt.executeQuery()) {
            createNewLeaseContractStmt.setInt(1, instrumentId);
            createNewLeaseContractStmt.setInt(2, instrumentId);
            createNewLeaseContractStmt.setTimestamp(3, startDate);
            createNewLeaseContractStmt.setTimestamp(4, endDate);
            createNewLeaseContractStmt.setInt(5, studentId);
            createNewLeaseContractStmt.execute();
            updateInstrumentStatusStmt.setBoolean(1, true);
            updateInstrumentStatusStmt.setInt(2, instrumentId);
            updateInstrumentStatusStmt.execute();
            updateInstrumentQuotaStmt.setInt(1, 1);
            updateInstrumentQuotaStmt.setInt(2, studentId);
            updateInstrumentQuotaStmt.execute();
            connection.commit();
        } catch (SQLException sqle) {
            connection.rollback();
            sqle.printStackTrace();
        }
    }
    
    /**
     * This function checks if a student has reached their instrument quota.
     * @param connection the connection
     * @param studentId the student id
     * @return boolean false if instrument quota is not full, true if it is
     * @throws SQLException 
     */
    private boolean checkInstrumentQuota(Connection connection, int studentId) throws SQLException {
        boolean quotaExceded = false;
        try {
            checkInstrumentQuotaStmt.setInt(1, studentId);
            ResultSet result = checkInstrumentQuotaStmt.executeQuery();
            result.next();
            if (result.getInt(1) == 2) {
                quotaExceded = true;
            }
            connection.commit();
            return quotaExceded;
        } catch (SQLException sqle) {
            connection.rollback();
            sqle.printStackTrace();
        }
        return quotaExceded;
    }
    
    private void terminateRental(Connection connection, int instrumentId, int studentId) throws SQLException {
        try {
            terminateLeaseContractStmt.setBoolean(1, false);
            terminateLeaseContractStmt.setInt(2, instrumentId);
            terminateLeaseContractStmt.execute();
            updateInstrumentStatusStmt.setBoolean(1, false);
            updateInstrumentStatusStmt.setInt(2, instrumentId);
            updateInstrumentStatusStmt.execute();
            updateInstrumentQuotaStmt.setInt(1, -1);
            updateInstrumentQuotaStmt.setInt(2, studentId);
            updateInstrumentQuotaStmt.execute();
            connection.commit();
        } catch (SQLException sqle) {
            connection.rollback();
            sqle.printStackTrace();
        }
    }
    
    /**
     * 
     * @throws SQLException 
     */
    public void commit() throws SQLException {
        try {
            connection.commit();
        } catch (SQLException e) {
            handleException("Failed to commit", e);
        }
    }

    /**
     * 
     * @param failureMsg
     * @param cause
     * @throws SQLException 
     */
    private void handleException(String failureMsg, Exception cause) throws SQLException {
        String completeFailureMsg = failureMsg;
        try {
            connection.rollback();
        } catch (SQLException rollbackExc) {
            completeFailureMsg = completeFailureMsg + 
            ". Also failed to rollback transaction because of: " + rollbackExc.getMessage();
        }

        if (cause != null) {
            throw new SQLException(failureMsg, cause);
        } else {
            throw new SQLException(failureMsg);
        }
    }
    
    /**
     * 
     * @param failureMsg
     * @param result
     * @throws SQLException 
     */
    private void closeResultSet(String failureMsg, ResultSet result) throws SQLException {
        try {
            result.close();
        } catch (Exception e) {
            throw new SQLException(failureMsg + " Could not close result set.", e);
        }
    }
    
    /**
     * Creates prepared statements to be executed in the database.
     * @param connection the database connection
     * @throws SQLException 
     */
    private void prepareStatements(Connection connection) throws SQLException {
        listAllInstrumentsStmt = connection.prepareStatement(
                "SELECT * FROM rental_instrument_inventory WHERE rented = FALSE");
        
        createNewLeaseContractStmt = connection.prepareStatement(
                "INSERT INTO lease_contract (instrument_id, type_of_instrument, contract_start_date, contract_end_date, student_id) " + 
                "VALUES (?, (SELECT type_of_instrument from rental_instrument_inventory WHERE id = ?), ?, ?, ?)");
        
        updateInstrumentStatusStmt = connection.prepareStatement(
                "UPDATE rental_instrument_inventory SET rented = ? WHERE id = ?");
        
        updateInstrumentQuotaStmt = connection.prepareStatement(
                "UPDATE student SET instrument_quota = instrument_quota + ? WHERE id = ?");
        
        checkInstrumentQuotaStmt = connection.prepareStatement(
                "SELECT instrument_quota FROM student WHERE id = ?");
        
        terminateLeaseContractStmt = connection.prepareStatement(
                "UPDATE lease_contract SET active = ? WHERE instrument_id = ?");
        
        activeLeaseContractStmt = connection.prepareStatement(
                "SELECT * FROM lease_contract WHERE student_id = ? AND active = TRUE");
    }
    
    /**
     * CLI menu.
     */
    private void interfaceMenu() {
       System.out.println("*****************************************************************************");
       System.out.println("****************  Soundgood music school - Instrument rental ****************");
       System.out.println("*****************************************************************************");
       System.out.println("*                                                                           *");
       System.out.println("* 1. List available instruments.                                            *");
       System.out.println("* 2. Rent instrument.                                                       *");
       System.out.println("* 3. Terminate rental.                                                      *");
       System.out.println("* 4. Exit rental interface                                                  *");
       System.out.println("*                                                                           *");
       System.out.println("*****************************************************************************");
    }
    
    /**
     * Formats a string on the format <dd/MM/yyy> and returns it as a Timestamp object.
     * @param string the string to be formatted
     * @return a valid timestamp
     */
    public static Timestamp stringToTimestamp(String string) {
        String dateTime = string.trim() + " 13:00:00";
        DateTimeFormatter formatDateTime = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        LocalDateTime localDateTime = LocalDateTime.from(formatDateTime.parse(dateTime));
        Timestamp timestamp = Timestamp.valueOf(localDateTime);
        return timestamp;
    }
    
    /**
     * Main program process. Controls the flow of the program.
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
                        try {
                            System.out.println("Enter your student ID: ");
                            int studentId = scanner.nextInt();
                            
                            if (dbms.checkInstrumentQuota(DBconnection, studentId)) {
                                System.out.println("You have already reached your instrument quota!");
                                break;
                            }
                            
                            System.out.println("Enter enter the ID of the instrument you want to rent: ");
                            int instrumentId = scanner.nextInt();
                            
                            // Check if instrument is avalable or not

                            System.out.println("Enter enter start date of rental <dd/mm/yyyy>: ");
                            String start = scanner.next();
                            Timestamp startDate = stringToTimestamp(start);

                            System.out.println("Enter enter end date of rental <dd/mm/yyyy>: ");
                            String end = scanner.next();
                            Timestamp endDate = stringToTimestamp(end);

                            dbms.rentInstrument(DBconnection, instrumentId, startDate, endDate, studentId);
                        } catch (Exception ex) {
                            System.out.println("Error with input: " + ex);
                        }
                        break;
                    case 3:
                        System.out.println("Enter your student ID: ");
                        int studenttermId = scanner.nextInt();
                        dbms.listAllContracts(DBconnection, studenttermId);
                        System.out.println("Enter instrument ID");
                        // Pass in contract id instead of instrument id
                        //
                        int instrumenttermId = scanner.nextInt();
                        dbms.terminateRental(DBconnection, instrumenttermId, studenttermId);
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
