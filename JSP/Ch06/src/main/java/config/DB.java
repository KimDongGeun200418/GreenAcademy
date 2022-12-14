package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DB {
	private static DB instance = new DB();
	
	public static DB getInstance() {
		return instance;
	}
	private DB() {}
	
	private final String HOST = "jdbc:mysql://127.0.0.1:3306/java1db";
	private final String USER = "root";
	private final String PASS = "1234";
	
	public Connection getConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(HOST, USER, PASS);
	}
	
	public Connection getDBCP() throws NamingException, SQLException {
		//1단계 - JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env"); //JNDI를 이용하기 위한 기본 이름
				
		//2단계 - 커넥션 풀 얻기
		DataSource ds = (DataSource) ctx.lookup("dbcp_java1db"); // 커넥션 풀 가져오기
		return ds.getConnection(); //커넥션 가져오기
	}
	
	public Connection getShop() throws NamingException, SQLException {
		//1단계 - JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env"); //JNDI를 이용하기 위한 기본 이름
				
		//2단계 - 커넥션 풀 얻기
		DataSource ds = (DataSource) ctx.lookup("dbcp_java1_Shop"); // 커넥션 풀 가져오기
		return ds.getConnection(); //커넥션 가져오기
	}
}
