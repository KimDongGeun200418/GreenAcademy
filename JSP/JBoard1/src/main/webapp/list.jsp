<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.config.Sql"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.jboard1.config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	//페이지 이동 처리
	request.setCharacterEncoding("utf-8");
	String pg = request.getParameter("pg");
	
	//list.jsp용
	ArticleDAO dao = ArticleDAO.getInstance();

	int start = 0;
	int total = 0;
	int lastPageNum = 0;
	int currentPage = 1;
	int currentPageGroup = 1;
	int pageGroupStart = 0;
	int pageGroupEnd = 0;
	int pageStartNum = 0;
	
	if(pg!=null){ currentPage = Integer.parseInt(pg); }
	start = (currentPage - 1) * 10;
	currentPageGroup = (int) Math.ceil(currentPage / 10.0);
	pageGroupStart = (currentPageGroup - 1) * 10 + 1;
	pageGroupEnd = currentPageGroup * 10;
	
	//전체 게시물 갯수
	total = dao.selectCountTotal();
	//마지막 페이지 번호
	if(total % 10 == 0){
		lastPageNum = total / 10;
	}else{
		lastPageNum = total / 10 + 1;
	}
	if (pageGroupEnd > lastPageNum){
		pageGroupEnd = lastPageNum;
	}
	
	pageStartNum = total - start;
	
	List<ArticleBean> articles = dao.selectArticles(start);
	
%>
<%@ include file="./_header.jsp" %>
        <main id="board" class="list">
            
            <table border="0">
                <caption>글목록</caption>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>날짜</th>
                    <th>조회</th>
                </tr>
                <% 
	                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	                for(ArticleBean article : articles){
                %>
			<tr>
				<td><%= pageStartNum-- %></td>
				<td><a href="#"><%= article.getTitle() %> [<%= article.getComment() %>]</a></td>
				<td><%= article.getNick() %></td>
				<td><%= article.getRdate().substring(2, 10) %></td>
				<td><%= article.getHit() %></td>
			</tr>
				<%} %>
            </table>

            <div class="page">
            	<% if (pageGroupStart > 1) { %>
                <a href="/JBoard1/list.jsp?pg=<%= pageGroupStart - 1%>" class="prev">이전</a>
                <% } %>
                <% for (int num = pageGroupStart ; num <= pageGroupEnd ; num++){ %>
                <a href="/JBoard1/list.jsp?pg=<%= num %>" class="num <%= num == currentPage ? "current" : "off"%>"><%= num %></a>
                <% } %>
                <% if(pageGroupEnd < lastPageNum){ %>
                <a href="/JBoard1/list.jsp?pg=<%= pageGroupEnd + 1 %>" class="next">다음</a>
            	<% } %>
            </div>

            
            <a href="/JBoard1/write.jsp" class="btnWrite">글쓰기</a>
            

        </main>
<%@ include file="./_footer.jsp" %>