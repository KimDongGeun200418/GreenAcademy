<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user4::modify</title>
	</head>
	<body>
		<form action="/Ch05/user4/modify" method="POST">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" readonly value="${ user.uid }" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${ user.name }" /></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" name="gender" value="${ user.gender }" /></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age" value="${ user.age }" /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" value="${ user.addr }" /></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정"/></td>
				</tr>
			</table>
		</form>
		
	</body>
</html>