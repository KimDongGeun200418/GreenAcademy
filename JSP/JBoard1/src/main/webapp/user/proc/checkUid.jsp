<%@page import="kr.co.jboard1.config.Sql"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	// 데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	
	//DB 확인
	int result = 0;
	
	try{
		
		Connection conn = DBCP.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_UID);
		psmt.setString(1, uid);
		
		ResultSet rs = psmt.executeQuery();
		if(rs.next()){
			result = rs.getInt(1);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result); // key, value
	
	String jsonData = json.toString();
	out.print(jsonData);
%>