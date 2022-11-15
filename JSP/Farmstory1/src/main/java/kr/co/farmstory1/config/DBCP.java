package kr.co.farmstory1.config;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCP {

	private static DataSource ds = null;
	
	public static Connection getConnection() throws NamingException, SQLException {
		if(ds == null) {
			ds = (DataSource) new InitialContext().lookup("java:comp/env/dbcp_aws_java1_board");
		}
		return ds.getConnection();
	}
}