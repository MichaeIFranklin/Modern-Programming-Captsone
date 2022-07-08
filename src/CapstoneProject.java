//******************************************************************************
//
//  Developer:     Michael Franklin
//
//  Project #:     Capstone
//
//  File Name:     CapstoneProject.java
//
//  Course:        COSC 4301 - Modern Programming
//
//  Due Date:      05/15/2022
//
//  Instructor:    Fred Kumi 
//
//  Description:   Driver class to run and test the Capstone Project classes and 
//				   functionality.
//
//
//******************************************************************************

import java.util.Scanner;

public class CapstoneProject
{	
	private Scanner inputStream;
	private DatabaseHelper database;
	private String CheckingID;
	private String SavingsID;
	
	//***************************************************************
	//
	//  Method:       main
	// 
	//  Description:  The main method of the program
	//
	//  Parameters:   String array
	//
	//  Returns:      N/A 
	//
	//**************************************************************
	public static void main(String[] args)
	{	       
		// Create an object of the main class and use it to call
		// the non-static developerInfo method
		CapstoneProject obj = new CapstoneProject();
		obj.developerInfo();

		// run setup
		obj.Setup();
		
		// main loop
		while(obj.database.IsConnected())
		{
			// prompt and validate login
			obj.Login();
			
			// show main menu (handles cleanup when needed)
			obj.ShowMainMenu();
		}
	}

	
	//***************************************************************
	//
	//  Method:       Setup (Non Static)
	// 
	//  Description:  sets up needed systems for the program
	//
	//  Parameters:   None
	//
	//  Returns:      N/A 
	//
	//**************************************************************
	public void Setup()
	{
		// setup scanner to get user input
		inputStream = new Scanner(System.in);
		
		// setup database helper
		database = new DatabaseHelper();
		
		// check that we are connected to the database
		if (database.IsConnected())
		{
			// print that setup is complete
			System.out.println("Setup Complete");
		}
		
	}

	
	//***************************************************************
	//
	//  Method:       Login
	// 
	//  Description:  prompts user for login credentials and validates login
	//				  loops until valid login is supplied.
	//
	//  Parameters:   None
	//
	//  Returns:      N/A 
	//
	//**************************************************************
	public void Login()
	{
		CheckingID = ""; // reset checkingID
		SavingsID = ""; // reset checkingID = ""; // reset savingsID
		String AccID = "";
		
		// welcome message
		System.out.println("Welcome to your ATM.");
		
		// while not loggedIn
		while (SavingsID.isEmpty())
		{
			
			boolean valid = false;
			String input = "";
			// prompt user for account ID
			while (!valid)
			{
				System.out.println("Please input your Account ID:");
				input = GetUserInput();
				
				// check length
				if (input.length() == 5)
				{
					// verify we only have digits
					valid = ValidateIntegerInput(input, null, null) != -1;
				}
				else
				{
					// output message
					System.out.println("Input must be exactly 5 digits in length.");
				}
			}
			AccID = input;
			
			valid = false;
			input = "";
			// prompt user for PIN
			while (!valid)
			{
				System.out.println("Please input your Account PIN:");
				input = GetUserInput();
				
				// check length
				if (input.length() == 5)
				{
					// verify we only have digits
					valid = ValidateIntegerInput(input, null, null) != -1;
				}
				else
				{
					// output message
					System.out.println("Input must be exactly 5 digits in length.");
				}
			}
			String PIN = input;
			
			// send login request to database
			SavingsID = database.Login(AccID, PIN);
		}
		
		// logged in, set session checking account ID
		CheckingID = AccID;		
	}
	
	
	//***************************************************************
	//
	//  Method:       ShowMainMenu
	// 
	//  Description:  displays and handles main menu
	//
	//  Parameters:   None
	//
	//  Returns:      N/A 
	//
	//**************************************************************
	public void ShowMainMenu()
	{
		// check that we are still connected to the database
		if (database.IsConnected())
		{
			Integer input = 0;
			while (input != 5)
			{
				// display menu
				System.out.print(
						"\nMain menu\n\n"
						+ "1 – View my balance\n"
						+ "2 – Withdraw money\n"
						+ "3 – Deposit money\n"
						+ "4 - Transfer money\n"
						+ "5 – Exit\n\n"
						+ "Enter your choice:");
				
				// get input
				String inputStr = GetUserInput();
				
				// validate input
				input = ValidateIntegerInput(inputStr, 1, 5);
				if (input != -1)
				{
					// containers for info values
					
					
					// handle input
					switch(input)
					{
					case 1: // show balance
						// get balances
						Double checkingBal = database.GetBalance(CheckingID, true);
						Double savingsBal = database.GetBalance(SavingsID, false);
						
						// print balance
						System.out.printf("Checking Account Balance: $%,.2f\n", checkingBal);
						System.out.printf("Savings Account Balance: $%,.2f\n", savingsBal);
						break;
					case 2: // withdraw
						// show withdraw menu
						Withdraw();
						break;
					case 3: // deposit
						// prompt for deposit amount
						Deposit();
						break;
					case 4: // transfer
						// show transfer prompts
						Transfer();
						break;
					case 5: // exit
						// print thank you message
						System.out.println("Thank you for using your ATM.\n\n\n");
						break;
					}
				}	
			}
		}
	}
	
	
	// ***************************************************************
	//
	// Method: ValidateIntegerInput
	//
	// Description: validates that input is a non-negative integer and within 
	//				passed range
	//
	// Parameters: String: input from the user
	//			   Integer: minimum value input can be, null to ignore
	//	   		   Integer: maximum value input can be, null to ignore
	//
	// Returns: Integer: validated output, -1 if input is not valid
	//
	// **************************************************************
	public int ValidateIntegerInput(String input, Integer min, Integer max)
	{
		int output = -1;
		
		// validate input is a number
		try
		{
			output = Integer.parseInt(input);

			// input string was a number, check range
			if ((min != null || max != null) && // do we have a range?
					(
					(max == null && output < min) || // only min specified or
					(min == null && output > max) || // only max specified or
					((min != null && max != null) && // both specified
					(output < min || output > max))
					))
			{
				// input out of range
				System.out.println(output + " is not a valid response. Please try again.");
				// invalid input
				output = -1;
			}
		}
		catch (NumberFormatException e)
		{
			// input not a number
			System.out.println("Please input numbers only.");
		}
		
		return output;
	}
	
	
	// ***************************************************************
	//
	// Method: ValidateDoubleInput
	//
	// Description: validates that input is a non-negative double and within 
	//				passed range
	//
	// Parameters: String: input from the user
	//			   Integer: minimum value input can be, null to ignore
	//	   		   Integer: maximum value input can be, null to ignore
	//
	// Returns: Integer: validated output, -1 if input is not valid
	//
	// **************************************************************
	public double ValidateDoubleInput(String input, Integer min, Integer max)
	{
		double output = -1;
		
		// validate input is a number
		try
		{
			output = Double.parseDouble(input);

			// input string was a number, check range
			if ((min != null || max != null) && // do we have a range?
					(
					(max == null && output < min) || // only min specified or
					(min == null && output > max) || // only max specified or
					((min != null && max != null) && // both specified
					(output < min || output > max))
					))
			{
				// input out of range
				System.out.println(output + " is not a valid response. Please try again.");
				// invalid input
				output = -1;
			}
		}
		catch (NumberFormatException e)
		{
			// input not a number
			System.out.println("Please input numbers only.");
		}
		
		return output;
	}
	
	
	//***************************************************************
	//
	//  Method:       SelectAccount
	// 
	//  Description:  prompts user for an amount to perform a transaction on
	//
	//  Parameters:   Integer: 0 if selected a withdraw account, 1 if
	//						   selecting a deposit account, 2 if a transfer
	//
	//  Returns:      String: account ID to perform transaction on, empty if
	//						  user chose to cancel transaction
	//
	//**************************************************************
	public String SelectAccount(Integer accType)
	{
		// prompt for account
		Integer input = -1;
		String accountID = "";
		while (input < 1 || input > 3)
		{
			// display menu
			String accountStr = "Transfer from";
			if (accType == 0)
				accountStr = "Withdraw from";
			else if (accType == 1)
				accountStr = "Deposit into";
				
			System.out.print(
					"\n" + accountStr + "  which account?\n\n"
					+ "1 – Checking\n"
					+ "2 – Savings\n"
					+ "3 – Cancel transaction\n\n"
					+ "Enter your choice:");
			
			// get input
			String inputStr = GetUserInput();
			
			// validate input
			input = ValidateIntegerInput(inputStr, 1, 3);
			if (input != -1)
			{
				// set amount based on input
				switch(input)
				{
				case 1:
					accountID = CheckingID;
					break;
				case 2:
					accountID = SavingsID;
					break;
				case 3: // exit
					break;
				}
			}	
		}
			
		return accountID;
	}


	//***************************************************************
	//
	//  Method:       Withdraw
	// 
	//  Description:  prompts user for a withdraw amount, then sends 
	//				  withdraw request to database and handles any errors, 
	//				  such as overdraw
	//
	//  Parameters:   None
	//
	//  Returns:      N/A
	//
	//**************************************************************
	public void Withdraw()
	{		
		// prompt for an account
		String accountID = SelectAccount(0);
		
		// if we are not canceling
		if (!accountID.isEmpty())
		{
			boolean success = false;
			while(!success)
			{
				Integer input = 0;
				Double amount = 0.0;
				while (input < 1 || input > 9)
				{
					// display menu
					System.out.print(
							"\nWithdrawal menu\n\n"
							+ "1 – $20\t\t5 – 100\n"
							+ "2 – $40\t\t6 – 120\n"
							+ "3 – $60\t\t7 – 160\n"
							+ "4 – $80\t\t8 – 200\n"
							+ "9 – Cancel transaction\n\n"
							+ "Enter your choice:");
					
					// get input
					String inputStr = GetUserInput();
					
					// validate input
					input = ValidateIntegerInput(inputStr, 1, 9);
					if (input != -1)
					{
						// set amount based on input
						switch(input)
						{
						case 1:
							amount = 20.0;
							break;
						case 2:
							amount = 40.0;
							break;
						case 3:
							amount = 60.0;
							break;
						case 4:
							amount = 80.0;
							break;
						case 5:
							amount = 100.0;
							break;
						case 6:
							amount = 120.0;
							break;
						case 7:
							amount = 160.0;
							break;
						case 8:
							amount = 200.0;
							break;
						case 9: // exit
							break;
						}
					}	
				
					// if we are not canceling
					if (input != 9)
					{				
						// send withdraw request
						success = database.Withdraw(accountID, amount, accountID.equals(CheckingID));
						
						if (success)
						{
							// print money reminder
							System.out.print("Please take your Money. (Press Enter)");
							inputStream.nextLine();
						}
					}	
					else
					{
						// stop looping
						success = true;
					}
				}
			}	
		}
	}
	
	
	//***************************************************************
	//
	//  Method:       Deposit
	// 
	//  Description:  prompts user for a deposit amount, then sends deposit 
	//				  request to database
	//
	//  Parameters:   None
	//
	//  Returns:      N/A
	//
	//**************************************************************
	public void Deposit()
	{
		// prompt for an account
		String accountID = SelectAccount(1);
		
		// if we are not canceling
		if (!accountID.isEmpty())
		{
			boolean valid = false;
			String input = "";
			
			// prompt user for an amount
			while (!valid)
			{
				System.out.print("Enter a Deposit Amount:"
						+ "\n(Or enter 0 to cancel.\n$");
				input = GetUserInput();
				
				// check for cancellation
				if (!input.equals("0"))
				{
					// verify a positive number was entered
					valid = ValidateDoubleInput(input, 0, null) != -1;
					
					// verify no more than two decimal places were input
					if (valid && input.contains("."))
					{
						if(input.split("\\.")[1].length() <= 2)
							valid = true;
						else
						{
							valid = false;
							System.out.println("Amount format not valid.");
						}
					}
				}
				else
				{
					// canceling, exit loop
					valid = true;
				}
			}
			
			// if we are not canceling
			if (!input.equals("0"))
			{
				Double amount = Double.parseDouble(input);
				
				// send deposit request
				database.Deposit(accountID, amount, accountID.equals(CheckingID));
			}	
		}
			
	}

	
	//***************************************************************
	//
	//  Method:       Transfer
	// 
	//  Description:  prompts user for a transfer amount, then sends 
	//				  transfer request to database and handles any errors, 
	//				  such as overdraw
	//
	//  Parameters:   None
	//
	//  Returns:      N/A
	//
	//**************************************************************
	public void Transfer()
	{
		// prompt for an account
		String accountID = SelectAccount(2);
				
		// if we are not canceling
		if (!accountID.isEmpty())
		{
			boolean success = false;
			while(!success)
			{
				String input = "";
				boolean valid = false;
				
				// prompt user for an amount
				while (!valid)
				{
					System.out.print("Enter a Transfer Amount:"
							+ "\n(Or enter 0 to cancel.\n$");
					input = GetUserInput();
					
					// check for cancellation
					if (!input.equals("0"))
					{
						// verify a positive number was entered
						valid = ValidateDoubleInput(input, 0, null) != -1;
						
						// verify no more than two decimal places were input
						if (valid && input.contains("."))
						{
							if(input.split("\\.")[1].length() <= 2)
								valid = true;
							else
							{
								valid = false;
								System.out.println("Amount format not valid.");
							}
						}
					}
					else
					{
						// canceling, exit loop
						valid = true;
					}
				}
				
				// if we are not canceling
				if (!input.equals("0"))
				{
					Double amount = Double.parseDouble(input);
					
					// send withdraw request
					success = database.Transfer(
							accountID.equals(CheckingID) ? CheckingID : SavingsID, 
							accountID.equals(CheckingID) ? SavingsID : CheckingID, amount,accountID.equals(CheckingID));
				}	
				else
				{
					// stop looping
					success = true;
				}
			}
		}
	}
	
	
	// ***************************************************************
	//
	// Method: GetUserInput
	//
	// Description: prompts the user for input and returns user input
	//
	// Parameters: None
	//
	// Returns: String: input from user
	//
	// **************************************************************
	public String GetUserInput()
	{			
		String input = "";
		while(input.equals(""))
		{
			input = inputStream.nextLine();
		}
		
		return input;
	}
	
	
	//***************************************************************
	//
	//  Method:       developerInfo (Non Static)
	// 
	//  Description:  The developer information method of the program
	//
	//  Parameters:   None
	//
	//  Returns:      N/A 
	//
	//**************************************************************
	public void developerInfo()
	{
		System.out.println("Name:    Michael Franklin");
		System.out.println("Course:  COSC 4301 Modern Programming");
		System.out.println("Project: Capstone\n");
	}

}

