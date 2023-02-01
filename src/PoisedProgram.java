import java.io.*;
import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * <H1>Poised Program</H1>
 * The Poised Program is a project management system that the
 * Poised Structural Engineering Firm can use to manage their projects.
 * <p>
 * The program will be used to:
 * · Add new projects to their folio of work
 * · Make modifications to existing projects
 * · View overdue and unfinished projects
 * · Search and view specific projects
 * · Finalise projects
 * <P>
 * It will read existing projects from an MySQL database and save any changes
 * to the projects database.
 *
 * @author Calum Gilchrist
 * @version 1.0
 */
public class PoisedProgram {
    // scanner to get user input
    public static final Scanner sc = new Scanner(System.in);
    // initialises statement for database so that all methods can access it
    static Statement statement = null;
    static int rowsAffected;
    /**
     * Will make a connection to the Database before running the main menu method
     */
    public static void main(String[] args) throws SQLException {
        Connection con = null;
        try {
            con = DriverManager.getConnection(
                    "jdbc:mysql://sql8.freemysqlhosting.net:3306/sql8587615",
                    "sql8587615",
                    "STrIVKtLqX"
            );
            // Create a direct line to the database for running queries and making changes
            statement = con.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        /*
         * This will run the display menu method and then whatever other
         * method is required based on the users choice
         */
        mainMenu(sc);
        // Closes the connection if still open.
        assert con != null;
        con.close();
    }
    /**
     * Gets the users choice from the displayed menu method and then triggers
     * the appropriate action.
     */
    public static void mainMenu(Scanner sc){
        // Menu loop
        while(true){
            // Runs the method to display the menu on screen
            displayMenu();
            // Get user choice
            String menuChoice = sc.nextLine();
            switch (menuChoice) {
                case "1" -> {
                    System.out.println("----- All Projects -----");
                    viewAllProjects();
                }
                case "2" -> {
                    System.out.println("----- Add a project -----");
                    addProject();
                }
                case "3" -> {
                    System.out.println("----- Amend Project -----");
                    amendProject();
                }
                case "4" -> {
                    System.out.println("----- Overdue Projects -----");
                    viewOverdueProjects();
                }
                case "5" -> {
                    System.out.println("----- Unfinished Projects -----");
                    viewUnfinishedProjects();
                }
                case "6" -> {
                    System.out.println("----- Finalise project -----");
                    finaliseProject();
                }
                case "7" -> {
                    System.out.println("----- Search projects -----");
                    searchProjects();
                }
                case "8" -> {
                    System.out.println("exiting program, goodbye");
                    System.exit(0);
                }
                default -> System.out.println("Menu choice not recognised." +
                        "\nEnter your choice again");
            }
        }
    }
    /**
     * Displays the main menu.
     */
    private static void displayMenu(){
        // Displays the menu
        System.out.println("\n      M E N U");
        System.out.println("===================");
        System.out.println("1. View all projects");
        System.out.println("2. Create new project");
        System.out.println("3. Amend a project");
        System.out.println("4. View overdue Projects");
        System.out.println("5. View unfinished Projects");
        System.out.println("6. Finalise a project");
        System.out.println("7. Search projects");
        System.out.println("8. Exit");
        System.out.println("====================");
        System.out.print("Enter choice: ");
    }
    /**
     * Creates a new 'project' by first gathering all required
     * information from the user, including triggering the 'person' method to
     * gather information about these.
     * This information is then all saved to the Database.
     */
    public static void addProject() {
        /*
        This will gather all the required data to create a new project
        and then add the Project to the Project list
         */
        try{
            // Project input
            System.out.print("Project number: ");
            int jobNumber = sc.nextInt();
            sc.nextLine();
            System.out.print("Project name: ");
            String jobName = sc.nextLine();
            System.out.print("Building type: ");
            String buildType = sc.nextLine();
            System.out.print("Project address: ");
            String physicalAddress = sc.nextLine();
            System.out.print("ERF number: ");
            int erfNumber = sc.nextInt();
            System.out.print("Total fee: ");
            double totalFee = sc.nextDouble();
            System.out.print("Amount paid: ");
            double totalPaid = sc.nextDouble();
            sc.nextLine();
            System.out.print("Project deadline (dd/mm/yyyy): ");
            String date = sc.nextLine();
            LocalDate deadline = getDate(date);
            // Call other methods to add people to project tables
            String architect = addPerson("Architect", "architects");
            String engineer = addPerson("Structural Engineer", "engineers");
            String projManager = addPerson("Project Manager", "proj_managers");
            String customer = addPerson("Customer", "customers");
            boolean completed = false;
            // Save project information to the database
            rowsAffected = statement.executeUpdate(
                    "INSERT INTO poised_projects VALUES ("+jobNumber+",'" +jobName+"', '"+buildType+"', '"+physicalAddress+"',"+erfNumber+", "+totalFee+", "+totalPaid+", '"+deadline+"', '"+architect+"', '"+engineer+"', '"+projManager+"', '"+customer+"', "+completed+")");
            System.out.println("New project added.");
        }
        catch (InputMismatchException e){
            System.out.println("Incorrect input type, please enter the project information again.");
            sc.next();
            addProject();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * Changes the date from a String to a Date so that calculations can be done on it
     * @param date the date in String format
     * @return the date in LocalDate format
     */
    public static LocalDate getDate(String date){
        LocalDate dateFormatted = null;
        try {
            //Create the DateTimeFormatter matching the input string format
            DateTimeFormatter format = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            //Using parse method to convert the string to LocalDate object
            dateFormatted = LocalDate.parse(date, format);
        }
        // If the String pattern is invalid or unable to be parsed
        catch (IllegalArgumentException | DateTimeParseException e) {
            System.out.println("Exception: " + e);
        }
        return dateFormatted;
    }
    /**
     *  Creates a person.
     *  This will gather the information about the person from the user
     * @param role passes whether it is Architect, Project Manager, Structural Engineer or Customer
     * @param tableName name of the table in the database where the person has to be stored
     * @return the Persons name
     */
    public static String addPerson(String role, String tableName) throws SQLException {
        System.out.println("\n----- " + role + " Information -----");
        System.out.print("Name: ");
        String personName = sc.nextLine();
        System.out.print("Phone number: ");
        String personNumber = sc.nextLine();
        System.out.print("Email: ");
        String personEmailAddress = sc.nextLine();
        System.out.print("Address: ");
        String personPhysicalAddress = sc.nextLine();
        // Saves the Person to the database
        rowsAffected = statement.executeUpdate(
                "INSERT INTO "+tableName+" VALUES ('"+personName+"','" +personNumber+"', '"+
                    personEmailAddress+"', '"+personPhysicalAddress+"')"
        );
        System.out.println(role + " added");
        return personName;
    }
    /**
     * User can make changes to project information
     * Fields to change include, Name, Type, Address, ERF No., Deadline
     */
    private static void amendProject() {
        System.out.println("=== Current Projects ===");
        displayJobNameNumber();
        try {
            System.out.println("Enter the job number you wish to amend the information of:");
            int jobNumber = Integer.parseInt(sc.nextLine());
            // Searches for the project from the job number
            ResultSet results = statement.executeQuery(
                    "SELECT * FROM poised_projects WHERE job_number =" + jobNumber
            );
            if (!results.isBeforeFirst()) {
                System.out.println("No job found with that number.");
            } else {
                // If the project exists they can make these changes
                System.out.println("""
                        What would you like to update?
                        1. Job Name
                        2. Build Type
                        3. Address
                        4. ERF Number
                        5. Deadline
                        0. Return to main menu
                        """);
                String menuChoice = sc.nextLine();
                switch (menuChoice) {
                    case "1" -> {
                        // Replaces the job name
                        System.out.println("Enter new Job Name:");
                        String jobName = sc.nextLine();
                        rowsAffected = statement.executeUpdate(
                                "UPDATE poised_projects SET job_name='" +
                                    jobName + "' WHERE job_number=" + jobNumber
                        );
                        System.out.println("Job name updated.");
                    }
                    case "2" -> {
                        // Replaces the build type
                        System.out.println("Enter new Build Type:");
                        String buildType = sc.nextLine();
                        rowsAffected = statement.executeUpdate(
                                "UPDATE poised_projects SET build_type='" +
                                    buildType + "' WHERE job_number=" + jobNumber
                        );
                        System.out.println("Build type updated.");
                    }
                    case "3" -> {
                        // Replaces the build address
                        System.out.println("Enter new Build Address:");
                        String buildAddress = sc.nextLine();
                        rowsAffected = statement.executeUpdate(
                                "UPDATE poised_projects SET physical_address='" +
                                    buildAddress + "' WHERE job_number=" + jobNumber
                        );
                        System.out.println("Address updated.");
                    }
                    case "4" -> {
                        // Updates the ERF number
                        System.out.println("Enter new ERF Number:");
                        int erfNumber = Integer.parseInt(sc.nextLine());
                        rowsAffected = statement.executeUpdate(
                                "UPDATE poised_projects SET erf_number=" +
                                    erfNumber + " WHERE job_number=" + jobNumber
                        );
                        System.out.println("ERF Number updated.");
                    }
                    case "5" -> {
                        // Updates the deadline date
                        System.out.println("Enter new deadline (dd/mm/yyyy): ");
                        String date = sc.nextLine();
                        LocalDate deadline = getDate(date);
                        rowsAffected = statement.executeUpdate(
                                "UPDATE poised_projects SET deadline='" +
                                    deadline + "' WHERE job_number=" + jobNumber
                        );
                        System.out.println("Deadline updated.");
                    }
                    case "0" -> {
                        System.out.println("Returning to main menu./n");
                    }
                    default -> System.out.println("Menu choice not recognised." +
                            "\nEnter your choice again:");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NumberFormatException e) {
            System.out.println("Not a valid job number.");
        }
    }
    /**
     * Displays all the projects that their due dates have passed.
     */
    public static void viewOverdueProjects(){
        try{
            // This will display a brief description of any projects whose deadlines dates have passed
            ResultSet rs = statement.executeQuery("SELECT * FROM poised_projects WHERE deadline < CURDATE()");
            while (rs.next()) {
                System.out.println(
                        "-------------------------------" +
                        "\nJob Number:      " + rs.getInt("job_number") +
                        "\nJob Name:        " + rs.getString("job_name") +
                        "\nBuild Deadline:  " + dateOutput(rs.getDate("deadline").toLocalDate()) +
                        "\nProject Manager: " + rs.getString("proj_manager") +
                        "\nCustomer:        " + rs.getString("customer")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * Displays the projects which are marked unfinished.
     */
    public static void viewUnfinishedProjects(){
        try{
            // This will display a brief description of any projects whose deadlines dates have passed
            ResultSet rs = statement.executeQuery("SELECT * FROM poised_projects WHERE completed = false");
            while (rs.next()) {
                System.out.println(
                        "-------------------------------" +
                                "\nJob Number:      " + rs.getInt("job_number") +
                                "\nJob Name:        " + rs.getString("job_name") +
                                "\nBuild Deadline:  " + dateOutput(rs.getDate("deadline").toLocalDate()) +
                                "\nProject Manager: " + rs.getString("proj_manager") +
                                "\nCustomer:        " + rs.getString("customer")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * Marks a project as complete. Will also generate amount still owed by the customer.
     */
    public static void finaliseProject() {
        /*
        Finalise the project, outputting information: customer info, amount owed, completion date
         */
        // Gets and displays the completion date (today's date)
        LocalDate date = LocalDate.now();
        // sets the format of how the date will display
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String completionDate = date.format(format);
        try{
            System.out.print("Project number you wish to finalise: ");
            int jobNumber = Integer.parseInt(sc.nextLine());
            // Changes the database to complete for the specified job
            rowsAffected = statement.executeUpdate(
                    "UPDATE poised_projects SET completed=true WHERE job_number=" + jobNumber
            );
            // Searches for the project from the job number
            ResultSet rs = statement.executeQuery(
                    "SELECT * FROM poised_projects " +
                            "INNER JOIN customers " +
                            "ON poised_projects.customer = customers.name " +
                            "WHERE job_number =" + jobNumber
            );
            while (rs.next()) {
                double amountOwed = rs.getDouble("total_fee") - rs.getDouble("total_paid");
                System.out.println("\n----- Finalised Project -----" +
                        "\nJob Name:        " + rs.getString("job_name") +
                        "\nCustomer:        " + rs.getString("customer") +
                        "\nCompletion Date: " + completionDate +
                        "\nAmount Owed:     £" + amountOwed
                );
                // If the value owed is 0 or less, no invoice is generated, otherwise one will be created
                if (amountOwed <= 0){
                    System.out.println("Fully Paid. No invoice required.");
                } else {
                    finalisedToFile(rs,amountOwed,completionDate);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * Saves completed job information to a text file
     *
     * @param rs job information from the database
     * @param amountOwed total owed
     * @param completionDate date completed
     */
    private static void finalisedToFile(ResultSet rs, double amountOwed, String completionDate ){
        try {
            // Creates a string of the text which will be written to the text file invoice
            String textToFile =
                "Job Number:      " + rs.getInt("job_number") +
                "\nJob Name:        " + rs.getString("job_name") +
                "\nCompletion Date: " + completionDate +
                "\n--------------------------------------" +
                "\nCustomer:        " + rs.getString("customer") +
                "\nAddress:         " + rs.getString("customers.physical_address") +
                "\nPhone Number:    " + rs.getString("phone_number") +
                "\nEmail:           " + rs.getString("email_address")+
                "\nProject Total:   £" + rs.getDouble("total_fee") +
                "\nAmount Paid:     £" + rs.getDouble("total_paid") +
                "\n--------------------------------------" +
                "\nAmount Owed:     £" + amountOwed;
            // Creates a 'Completed project (x)' file to save the information to. Where x=job number so that
            // multiple can exist, one for each job.
            BufferedWriter writer = new BufferedWriter(new FileWriter
                    (String.format("Invoices\\Completed project %s.txt",rs.getInt("job_number"))));
            writer.write(textToFile);
            writer.close();
            System.out.println("\n== Invoice generated ==");
        } catch (IOException e) {
            // In case of error writing to the text file
            System.err.println("Error writing to file");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * Search the database for a specific project by job name or number
     */
    private static void searchProjects() {
        System.out.println("Please enter the job number or job name you wish to search for:");
        String jobNameSearch = sc.nextLine();
        int jobNumberSearch = 0;
        // Try to convert the user input to an Int but if it is a string it will be ignored
        try{
            jobNumberSearch = Integer.parseInt(jobNameSearch);
        } catch (NumberFormatException ignore) {
            // this is ignored as wouldn't want an exception thrown when a 'job_name' is entered
        }
        try{
            ResultSet rs = statement.executeQuery(
                    "SELECT * FROM poised_projects WHERE job_name ='"+
                            jobNameSearch+"' or job_number ="+jobNumberSearch
            );
            if (!rs.isBeforeFirst() ) {
                System.out.println("No job found with that name or number.");
            } else{
                // If the project exists info about it will be displayed on screen
                while (rs.next()) {
                    displayProject(rs);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * Displays all job names and numbers
     */
    public static void displayJobNameNumber(){
        try{
            ResultSet rs = statement.executeQuery("SELECT * FROM poised_projects");
            while (rs.next()) {
                System.out.println(
                        "No.: " + rs.getInt("job_number") +
                        " | Name: " + rs.getString("job_name")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * Displays all projects stored in the Database
     */
    public static void viewAllProjects(){
        try{
            ResultSet rs = statement.executeQuery("SELECT * FROM poised_projects");
            while (rs.next()) {
                // Sends each project info to the method to display on screen
                displayProject(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * This will take the date and convert it to a String in a format that is easily readable
     * @param date the date in format yyyy-MM-dd
     * @return the date in format dd/MM/yyyy
     */
    private static String dateOutput(LocalDate date){
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return date.format(format);
    }
    /**
     * Shows any results passed in an easy-to-read format.
     * @param rs results from query sent
     */
    public static void displayProject(ResultSet rs){
        try{
            // This changes the True or False from completed column to Yes or No as it reads easier
            String completed = "No";
            if (rs.getBoolean("completed")){
                completed = "Yes";
            }
            System.out.println(
                    "\n-------------------------------" +
                            "\nJob Number:      " + rs.getInt("job_number") +
                            "\nJob Name:        " + rs.getString("job_name") +
                            "\nBuild Type:      " + rs.getString("build_type") +
                            "\nProject Address: " + rs.getString("physical_address") +
                            "\nERF Number:      " + rs.getInt("erf_number") +
                            "\nProject Total:   " + rs.getDouble("total_fee") +
                            "\nAmount Paid:     " + rs.getDouble("total_paid") +
                            "\nAmount Owed:     " + (rs.getDouble("total_fee")-rs.getDouble("total_paid")) +
                            "\nBuild Deadline:  " + dateOutput(rs.getDate("deadline").toLocalDate()) +
                            "\nCompleted:       " + completed +
                            "\nArchitect:       " + rs.getString("architect") +
                            "\nEngineer:        " + rs.getString("engineer") +
                            "\nProject Manager: " + rs.getString("proj_manager") +
                            "\nCustomer:        " + rs.getString("customer")
            );
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}