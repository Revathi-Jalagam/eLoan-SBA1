package com.iiht.evaluation.eloan.dao;

import java.net.http.HttpRequest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import com.google.protobuf.Internal.ListAdapter.Converter;
import com.iiht.evaluation.eloan.dto.LoanDto;
import com.iiht.evaluation.eloan.model.ApprovedLoan;
import com.iiht.evaluation.eloan.model.LoanInfo;
import com.iiht.evaluation.eloan.model.User;

public class ConnectionDao {
	private static final long serialVersionUID = 1L;
	private String jdbcURL;
	private String jdbcUsername;
	private String jdbcPassword;
	private Connection jdbcConnection;

	public ConnectionDao(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }

	public  Connection connect() throws SQLException {
		if (jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}
			jdbcConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/eloan", "root", "P@55word");
			//jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}
		return jdbcConnection;
	}

	public void disconnect() throws SQLException {
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}
	
	// put the relevant DAO methods here..
	public void getData() {
		try {
			String query = "Select * From UsersInfo";
			jdbcConnection = connect();
			Statement statement = jdbcConnection.createStatement();
			ResultSet rs = statement.executeQuery(query);
			if(rs.next()) {
				String s = rs.getString("UserName");
			}
			 
			
		}catch(SQLException se) {
			se.printStackTrace();
		}
	}
	
	public boolean validateUser(String username,String password) throws SQLException
	{
		this.connect();
		boolean res = false;

		String sql = "select UserName,Password from UsersInfo where UserName=? and Password=?";
		PreparedStatement pst = connect().prepareStatement(sql);
		pst.setString(1, username);
		pst.setString(2, password);

		ResultSet rs = pst.executeQuery();

		if(rs.next())
		{
			res = true;
		}
		else
		{
			res = false;
		}
		this.disconnect();
		
		return res;		
	}
	public boolean registerNewUser(String username, String password) throws SQLException 
	{ 
		this.connect();

		String sql = "insert into user (username,password) values (? , ?) "; 

		PreparedStatement pst = connect().prepareStatement(sql); 
		pst.setString(1, username);
		pst.setString(2, password);
		
		int n = pst.executeUpdate();

		pst.close();
		this.disconnect();

		if(n>0)
			return true;
		else
			return false;
	}

	public boolean application(int aplno, String loantype, String amountRequested, String loanApplicationDate,
			String businessStructure, String billingIndicator, String taxIndicator, String contactAddress,
			String emailid, String mobile, int userid)  throws SQLException 
	{
		this.connect();
		int n = 0;
		try {
		String sql = "Insert Into loaninfo (UserId,LoanName,ApplicationNumber,AppliedAmount,ApplicationDate,BusinessStructure,BillingIndicator,TaxIndicator,LoanStatus) Values(? , ? , ? , ? , ? , ? , ? , ? , ?) ";
		PreparedStatement pst = connect().prepareStatement(sql); 
		pst.setInt(1, userid);
		pst.setString(2, loantype);
		pst.setInt(3, aplno);
		pst.setString(4, amountRequested);
		pst.setString(5, loanApplicationDate);
		pst.setString(6, businessStructure);
		pst.setString(7, billingIndicator);
		pst.setString(8, taxIndicator);
		pst.setString(9, "A");
		
		n = pst.executeUpdate();

		pst.close();
		this.disconnect();
		}catch(SQLException se) {
			se.printStackTrace();
		}
		if(n>0)
			return true;
		else
			return false;
	}
	
	public String trackStatus(int applicationnumber) throws SQLException 
	{ 
		this.connect();
		
		String status = "";
		String sql = "select UserId,ApplicationNumber,LoanStatus from loaninfo where ApplicationNumber = " + applicationnumber; 
		
		PreparedStatement pst = connect().prepareStatement(sql); 
		//pst.setInt(1, applicationnumber);
		try {
		ResultSet rs = pst.executeQuery(sql);
		if(rs.next()) {
			status = rs.getString("LoanStatus");
		}
		}catch(SQLException se) {
			se.printStackTrace();
		}
		pst.close();
		this.disconnect();
		return status;
		
	}
	
	public void fetchAllLoans() {
		try {
			String query = "Select * From loaninfo";
			jdbcConnection = connect();
			Statement statement = jdbcConnection.createStatement();
			ResultSet rs = statement.executeQuery(query);
			if(rs.next()) {
				String s = rs.getString("UserName");
			}
			 
			
		}catch(SQLException se) {
			se.printStackTrace();
		}
	}
	
	public List<LoanInfo> getLoanList() throws SQLException {
		String sql = "Select L.ApplicationNumber,L.LoanName,L.AppliedAmount,L.ApplicationDate,L.BusinessStructure,L.BillingIndicator,U.Address,U.Email,U.MobileNo,L.LoanStatus\r\n"
				+ "From LoanInfo L join UsersInfo U on L.UserId = U.UserId";
		this.connect();
		
		PreparedStatement pst = connect().prepareStatement(sql);
		ResultSet rs = pst.executeQuery(sql);
		
		// map it to model
		List<LoanInfo> loans = new ArrayList<LoanInfo>();
		while(rs.next()) {
			LoanInfo loan = new LoanInfo(rs.getString("ApplicationNumber"), 
											 rs.getString("LoanName"), 
											 rs.getInt("AppliedAmount"), 
											 rs.getString("ApplicationDate"),
											 rs.getString("BusinessStructure"), 
											 rs.getString("BillingIndicator"), 
											 rs.getString("Address"),
											 rs.getString("Email"),
											 rs.getString("MobileNo"), 
											 rs.getString("LoanStatus"));
			loans.add(loan);		
		}
		
		rs.close();
		pst.close();
		this.disconnect();
		
		return loans;
	}
	
	public LoanInfo getLoanDetails(int applicationnumber) throws SQLException{
		this.connect();
		String sql = "select * from LoanInfo where ApplicationNumber = " + applicationnumber;
		PreparedStatement pst = connect().prepareStatement(sql);
		ResultSet rs = pst.executeQuery(sql);
		
		LoanInfo li = new LoanInfo();
		if (rs.next()) {
			li.setApplno(rs.getString("ApplicationNumber"));				
			li.setAmtrequest(Integer.parseInt(rs.getString("AppliedAmount")));
			li.setBstructure(rs.getString("BusinessStruture"));
			li.setDoa(rs.getString("ApplicationDate"));
			li.setBindicator(rs.getString("TaxIndiacator"));
		}
		return li;
	}
}
