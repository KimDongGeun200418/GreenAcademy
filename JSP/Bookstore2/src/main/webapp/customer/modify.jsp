<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BookStore::CustomerModify</title>
	</head>
	<body>
		<h3>고객수정</h3>
		<a href="/Bookstore2/index.jsp">처음으로</a>
		<a href="/Bookstore2/customer/list.do">고객목록</a>

		<form action="/Bookstore2/customer/modify.do" method="post">
			<table border="1" class="customerModify">
				<tr>
					<td>고객번호</td>
					<td> <input type="text" name="custId" readonly value="${customer.getCustId()}"/></td>
				</tr>
				<tr>
					<td>고객명</td>
					<td> <input type="text" name="custName" value="${customer.getCustName()}"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td> <input type="text" name="custAddr" value="${customer.getCustAddr()}"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="custHp" value="${customer.getCustHp()}"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정"/>
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>