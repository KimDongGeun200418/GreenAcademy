<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String uId 		= request.getParameter("uId");
	String uPass 		= request.getParameter("uPass1");
	String uName 	= request.getParameter("uName");
	String uNick 	= request.getParameter("uNick");
	String uMail 	= request.getParameter("uMail");
	String uPh 		= request.getParameter("uPh");
	String uRegip 	= request.getRemoteAddr(); //클라이언트 IP주소

	try{
		Connection conn = DBCP.getConnection();
		String sql = "INSERT INTO `board_user` set ";
			   sql += "`uid`=?,";
			   sql += "`pass`=?,";
			   sql += "`name`=?,";
			   sql += "`nick`=?,";
			   sql += "`email`=?,";
			   sql += "`hp`=?,";
			   sql += "`regip`=?,";
			   sql += "`rdate`=NOW()";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, uId);
		psmt.setString(2, uPass);
		psmt.setString(3, uName);
		psmt.setString(4, uNick);
		psmt.setString(5, uMail);
		psmt.setString(6, uPh);
		psmt.setString(7, uRegip);
		
		psmt.executeUpdate();
		
		
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//리다이렉트
	response.sendRedirect("/JBoard1/user/login.jsp");
	
%>