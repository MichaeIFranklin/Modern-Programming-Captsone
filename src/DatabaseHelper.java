//******************************************************************************
//
//  Developer:     Michael Franklin
//
//  Project #:     Capstone
//
//  File Name:     DatabaseHelper.java
//
//  Course:        COSC 4301 - Modern Programming
//
//  Due Date:      05/15/2022
//
//  Instructor:    Fred Kumi 
//
//  Description:   Handles database connectivity, query and response handling
//
//
//******************************************************************************

import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

public class DatabaseHelper {
	// Tables Infos
	final private String AccountsTable = "Accounts";
	final private String AccountsID = "AccountID";
	final private String AccountsSavings = "SavingsID";
	final private String AccountsPIN = "PIN";
	final private String AccountsName = "Name";
	final private String CheckingTable = "Checking";
	final private String CheckingID = "AccountID";
	final private String CheckingAmount = "Amount";
	final private String SavingsTable = "Savings";
	final private String SavingsID = "AccountID";
	final private String SavingsAmount = "Amount";
	
	private Connection connection;
	private ConnectToOracleDB dbConnect;
	
	public DatabaseHelper()
	{
		// connect to database
		connection = ConnectToDatabase();
		
		// add shutdown hook
		Runtime.getRuntime().addShutdownHook(new Thread() {
		       public void run()
		       {
		           // run server close sequence before full termination
		    	   CloseConnection();
		       }
		       });
	}
	
	// returns true if we have a connection to the database
	public boolean IsConnected()
	{
		return connection != null;
	}
	
	
	// ***************************************************************
	//
	// Method:      ConnectToDatabase
	//
	// Description: Setup connection to database
	//
	// Parameters:  None
	//
	// Returns:     N/A
	//
	// **************************************************************
	public Connection ConnectToDatabase() 
	{
		Connection connection = null;
		
		dbConnect = new ConnectToOracleDB();
		
		try 
		{
		   dbConnect.loadDrivers();
		   connection = dbConnect.connectDriver();
		}
		catch (Exception e) 
		{
            //System.out.println("Something terrible went wrong");
            System.exit(0);
		}
		
		return connection;
	}
	
	
	//***************************************************************
	//
	//  Method:       Login
	// 
	//  Description:  sends login request to the database and validates login 
	//				  credentials
	//
	//  Parameters:  String: Account ID to log into
	//				 String: PIN of Account to log into
	//
	//  Returns:     String: savings account ID if login successful
	//						 empty string if not successful
	//
	//**************************************************************
	public String Login(String AccID, String PIN)
	{
		String savingsID = "";
		String statement = "";
		Statement stmt = null;
		ResultSet res = null;
		
		// send the SQL query
		// try to find a matching Account ID
		statement = "SELECT * FROM " + AccountsTable + "\n"
				+ "WHERE " + AccountsID + " = \'" + AccID + "\'";
		
		try
		{
			stmt = connection.createStatement();
	        res = stmt.executeQuery(statement);
		
			if (res != null)
			{
				// check if we did not get a row returned
				if (!res.next()) {    
					// no account found with that ID
					System.out.println("ID not found. Please Try Again."); 
				} 
				else
				{
					// while there are still records to read
					do
					{
			            // get PIN
						String ResPIN = res.getString(AccountsPIN);
						
						// check for a match to passed PIN
						if (ResPIN.equals(PIN))
						{
							// validated
							// get name and savings account id
							String Name = res.getString(AccountsName);
							savingsID = res.getString(AccountsSavings);
							
							// print welcome message
							System.out.printf("Access Granted\nWelcome %s.\n", Name);
						}
						else
						{
							// output message
							System.out.println("PIN Incorrect. Please Try again.");
						}
					}while(res.next());
				} 
			}
		}
		catch(SQLException e)
		{
			// print out error
			System.out.println("Error while logging in.");
			System.out.println("SQL: " + statement);
			e.printStackTrace();
		}
		
		// cleanup database resources
		CloseResources(stmt, res);
		
		return savingsID;
	}
	
	
	//***************************************************************
	//
	//  Method:       GetBalance
	// 
	//  Description:  retrieves the balance for the passed account
	//
	//  Parameters:  String: Account ID
	//				 Boolean: true if withdrawing from checking account,
	//						  false if not
	//
	//  Returns:     Double: Total balance for account
	//
	//**************************************************************
	public Double GetBalance(String AccID, Boolean checking)
	{
		Double balance = 0.0;
		String statement = "";
		Statement stmt = null;
		ResultSet res = null;
		
		// send the SQL query
		// try to find a matching Account ID
		if (checking)			
			statement = "SELECT " + CheckingAmount + " AS Amount " + " FROM " + CheckingTable + "\n"
				+ "WHERE " + CheckingID + " = \'" + AccID + "\'";
		else
			statement = "SELECT " + SavingsAmount + " AS Amount " + " FROM " + SavingsTable + "\n"
					+ "WHERE " + SavingsID + " = \'" + AccID + "\'";
		
		try
		{
			stmt = connection.createStatement();
	        res = stmt.executeQuery(statement);
		
			if (res != null)
			{
				// check if we did not get a row returned
				if (!res.next()) {    
					// no account found with that ID
					System.out.println("Error: Account disconnected. Please Log in and try again."); 
					System.exit(0);
				} 
				else
				{
					// while there are still records to read
					do
					{
			            // get PIN
						balance = res.getDouble("Amount");
					}while(res.next());
				} 
			}
		}
		catch(SQLException e)
		{
			// print out error
			System.out.println("Error while getting balance.");
			System.out.println("SQL: " + statement);
			e.printStackTrace();
		}
		
		// cleanup database resources
		CloseResources(stmt, res);
		
		return balance;
	}
		
	
	//***************************************************************
	//
	//  Method:       Withdraw
	// 
	//  Description:  sends a withdraw request to the database
	//
	//  Parameters:   String: Account ID of account to withdraw out of
	//				  Double: Amount to withdraw
	//				  Boolean: true if withdrawing from checking account,
	//						   false if not
	//
	//  Returns:      Boolean: true if successful, false if not
	//
	//**************************************************************
	public boolean Withdraw(String AccID, Double amount, Boolean checking)
	{
		// send the SQL query
		boolean success = false;
		String statement = "";
		
		if (checking)
			statement = "UPDATE " + CheckingTable + " SET "
				+ CheckingAmount + " = "
				+ CheckingAmount + " - " + amount
				+ "\nWHERE " + CheckingID + " = \'" + AccID + "\'";
		else
			statement = "UPDATE " + SavingsTable + " SET "
					+ SavingsAmount + " = "
					+ SavingsAmount + " - " + amount
					+ "\nWHERE " + SavingsID + " = \'" + AccID + "\'";
		
		Statement stmt = null;
		
		try
		{
			stmt = connection.createStatement();
			int count = stmt.executeUpdate(statement);
		
			if (count == 1)
			{
	            // update successful
				success = true;
				System.out.printf("$%,.2f Successfully Withdrawn.\n", amount);
			}
			else
			{
				// print out error
				System.out.printf("Error: $%,.2f Not Withdrawn.\n", amount);
			}
		}
		catch(SQLException e)
		{
			if (e instanceof SQLIntegrityConstraintViolationException)
			{
				// print withdraw amount is too much
				System.out.printf("$%,.2f is too large an amount to Withdraw.\nPlease try a smaller amount.\n", amount);
			}
			else
			{
				// print out error
				System.out.println("Error during Withdraw.");
				System.out.println("SQL: " + statement);
				e.printStackTrace();
			}
			
		}
		
		// cleanup database resources
		CloseResources(stmt);
		
		return success;
	}
	
	
	//***************************************************************
	//
	//  Method:       Deposit
	// 
	//  Description:  sends a deposit request to the database
	//
	//  Parameters:   String: Account ID of account to deposit into
	//				  Double: Amount to deposit
	//				  Boolean: true if withdrawing from checking account,
	//						   false if not
	//
	//  Returns:      N/A
	//
	//**************************************************************
	public void Deposit(String AccID, Double amount, Boolean checking)
	{
		// send the SQL query
		String statement = "";
		
		if (checking)
			statement = "UPDATE " + CheckingTable + " SET "
				+ CheckingAmount + " = "
				+ CheckingAmount + " + " + amount
				+ "\nWHERE " + CheckingID + " = \'" + AccID + "\'";
		else
			statement = "UPDATE " + SavingsTable + " SET "
					+ SavingsAmount + " = "
					+ SavingsAmount + " + " + amount
					+ "\nWHERE " + SavingsID + " = \'" + AccID + "\'";
		
		Statement stmt = null;
		
		try
		{
			stmt = connection.createStatement();
			int count = stmt.executeUpdate(statement);
		
			if (count == 1)
			{

	            // update successful
				System.out.printf("$%,.2f Successfully Deposited.\n", amount);
			}
			else
			{
				// print out error
				System.out.printf("Error: $%,.2f Not Deposited.\n", amount);
			}
		}
		catch(SQLException e)
		{
			// print out error
			System.out.println("Error during Deposit.");
			System.out.println("SQL: " + statement);
			e.printStackTrace();
		}
		
		// cleanup database resources
		CloseResources(stmt);
	}
	
	
	//***************************************************************
	//
	//  Method:       Transfer
	// 
	//  Description:  sends a transfer request to the database
	//
	//  Parameters:   String: Account ID of account to transfer from
	//				  String: Account ID of account to transfer to
	//				  Double: Amount to transfer
	//				  Boolean: true if withdrawing from checking account,
	//						   false if not
	//
	//  Returns:      Boolean: true if successful, false if not
	//
	//**************************************************************
	public boolean Transfer(String FromID, String ToID, Double amount, Boolean checking)
	{
		// send the SQL query
		
		boolean success = false;
		String statement = "";
		
		// first try to withdraw from FromAccount
		if (checking)
			statement = "UPDATE " + CheckingTable + " SET "
				+ CheckingAmount + " = "
				+ CheckingAmount + " - " + amount
				+ "\nWHERE " + CheckingID + " = \'" + FromID + "\'";
		else
			statement = "UPDATE " + SavingsTable + " SET "
					+ SavingsAmount + " = "
					+ SavingsAmount + " - " + amount
					+ "\nWHERE " + SavingsID + " = \'" + FromID + "\'";
				
		Statement stmt = null;
		
		try
		{
			// turn off auto commits from transfers
			connection.setAutoCommit(false);
			stmt = connection.createStatement();
			int count = stmt.executeUpdate(statement);
		
			if (count == 1)
			{
	            // withdraw successful				
				success = true;
				System.out.printf("$%,.2f Successfully Transfered from " + (checking ? "Checking" : "Savings") + ".\n", amount);
			}
			else
			{
				// print out error
				connection.rollback();
				System.out.printf("Error: $%,.2f Not Transfered from " + (checking ? "Checking" : "Savings") + ".\n", amount);
			}
		}
		catch(SQLException e)
		{
			if (e instanceof SQLIntegrityConstraintViolationException)
			{
				// print withdraw amount is too much
				System.out.printf("$%,.2f is too large an amount to Transfer from " + (checking ? "Checking" : "Savings") + ".\nPlease try a smaller amount.\n", amount);
			}
			else
			{
				// print out error
				System.out.println("Error during Transfer from " + (checking ? "Checking" : "Savings") + ".");
				System.out.println("SQL: " + statement);
				e.printStackTrace();
			}
		}
		
		// if withdraw from FromAccount was successful
		if (success)
		{
			
			// send deposit request to ToAccount
			if (checking)
				statement = "UPDATE " + SavingsTable + " SET "
					+ SavingsAmount + " = "
					+ SavingsAmount + " + " + amount
					+ "\nWHERE " + SavingsID + " = \'" + ToID + "\'";
			else
				statement = "UPDATE " + CheckingTable + " SET "
						+ CheckingAmount + " = "
						+ CheckingAmount + " + " + amount
						+ "\nWHERE " + CheckingID + " = \'" + ToID + "\'";
			
			try
			{
				int count = stmt.executeUpdate(statement);
			
				if (count == 1)
				{
		            // update successful
					connection.commit();
					System.out.printf("$%,.2f Successfully Transfered to " + (checking ? "Savings" : "Checking") + ".\n", amount);
				}
				else
				{
					// print out error
					connection.rollback();
					System.out.printf("Error: $%,.2f Not Transfered to " + (checking ? "Savings" : "Checking") + ".\n", amount);
				}
			}
			catch(SQLException e)
			{
				// print out error
				System.out.println("Error during Transfer to " + (checking ? "Savings" : "Checking") + ".");
				System.out.println("SQL: " + statement);
				e.printStackTrace();
			}
		}
		
		// cleanup database resources
		CloseResources(stmt);
		
		return success;
	}

	
	//***************************************************************
	//
	//  Method:       CloseResources
	// 
	//  Description:  closes all open database query resources for cleaning
	//
	//  Parameters:   None
	//
	//  Returns:      N/A 
	//
	//**************************************************************
	public void CloseResources(Statement statement)
	{
		CloseResources(statement, null);
	}
	public void CloseResources(Statement statement, ResultSet results)
	{
					
		try 
		{
			if (statement != null)
			{
				statement.close();
			}
			if (results != null)
			{
				results.close();
			}
			
			// turn back on auto commits
			connection.setAutoCommit(true);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}	
	
	
	
	//***************************************************************
	//
	//  Method:       CloseConnection
	// 
	//  Description:  closes all open connections
	//
	//  Parameters:   None
	//
	//  Returns:      N/A 
	//
	//**************************************************************
	public void CloseConnection()
	{
		if (dbConnect != null)
		{			
			try 
			{
				dbConnect.closeDBConnection();
			}
			catch (Exception e) 
			{	            
	            e.printStackTrace();
				System.exit(0);
			}
		}
	}		
	
}
